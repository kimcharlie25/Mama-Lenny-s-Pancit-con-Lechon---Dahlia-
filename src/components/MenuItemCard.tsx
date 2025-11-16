import React, { useState } from 'react';
import { Plus, Minus, X, ShoppingCart } from 'lucide-react';
import { MenuItem, Variation, AddOn } from '../types';

interface MenuItemCardProps {
  item: MenuItem;
  onAddToCart: (item: MenuItem, quantity?: number, variation?: Variation, addOns?: AddOn[]) => void;
  quantity: number;
  onUpdateQuantity: (id: string, quantity: number) => void;
}

const MenuItemCard: React.FC<MenuItemCardProps> = ({ 
  item, 
  onAddToCart, 
  quantity, 
  onUpdateQuantity 
}) => {
  const [showCustomization, setShowCustomization] = useState(false);
  const [selectedVariation, setSelectedVariation] = useState<Variation | undefined>(
    item.variations?.[0]
  );
  const [selectedAddOns, setSelectedAddOns] = useState<(AddOn & { quantity: number })[]>([]);

  const calculatePrice = () => {
    // Use full variation price when a variation is selected so that
    // admin-entered variation prices match what the customer sees.
    let price = selectedVariation
      ? selectedVariation.price
      : (item.effectivePrice || item.basePrice);
    selectedAddOns.forEach(addOn => {
      price += addOn.price * addOn.quantity;
    });
    return price;
  };

  const handleAddToCart = () => {
    if (item.variations?.length || item.addOns?.length) {
      setShowCustomization(true);
    } else {
      onAddToCart(item, 1);
    }
  };

  const handleCustomizedAddToCart = () => {
    // Convert selectedAddOns back to regular AddOn array for cart
    const addOnsForCart: AddOn[] = selectedAddOns.flatMap(addOn => 
      Array(addOn.quantity).fill({ ...addOn, quantity: undefined })
    );
    onAddToCart(item, 1, selectedVariation, addOnsForCart);
    setShowCustomization(false);
    setSelectedAddOns([]);
  };

  const handleIncrement = () => {
    onUpdateQuantity(item.id, quantity + 1);
  };

  const handleDecrement = () => {
    if (quantity > 0) {
      onUpdateQuantity(item.id, quantity - 1);
    }
  };

  const updateAddOnQuantity = (addOn: AddOn, quantity: number) => {
    setSelectedAddOns(prev => {
      const existingIndex = prev.findIndex(a => a.id === addOn.id);
      
      if (quantity === 0) {
        // Remove add-on if quantity is 0
        return prev.filter(a => a.id !== addOn.id);
      }
      
      if (existingIndex >= 0) {
        // Update existing add-on quantity
        const updated = [...prev];
        updated[existingIndex] = { ...updated[existingIndex], quantity };
        return updated;
      } else {
        // Add new add-on with quantity
        return [...prev, { ...addOn, quantity }];
      }
    });
  };

  const groupedAddOns = item.addOns?.reduce((groups, addOn) => {
    const category = addOn.category;
    if (!groups[category]) {
      groups[category] = [];
    }
    groups[category].push(addOn);
    return groups;
  }, {} as Record<string, AddOn[]>);

  return (
    <>
      <div className={`bg-white rounded-2xl shadow-sm hover:shadow-xl transition-all duration-300 overflow-hidden group animate-scale-in border border-slate-100 ${!item.available ? 'opacity-60' : ''}`}>
        <div className="flex gap-4 p-4 sm:p-5">
          {/* Image Container with Badges */}
          <div className="relative w-24 h-24 sm:w-32 sm:h-32 rounded-xl overflow-hidden bg-gradient-to-br from-orange-50 to-white flex-shrink-0">
            {item.image ? (
              <img
                src={item.image}
                alt={item.name}
                className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105"
                loading="lazy"
                decoding="async"
                onError={(e) => {
                  e.currentTarget.style.display = 'none';
                  e.currentTarget.nextElementSibling?.classList.remove('hidden');
                }}
              />
            ) : null}
            <div className={`absolute inset-0 flex items-center justify-center ${item.image ? 'hidden' : ''}`}>
              <div className="text-4xl sm:text-5xl opacity-20 text-slate-300">🍽️</div>
            </div>
            
            {/* Badges */}
            <div className="absolute top-2 left-2 flex flex-col gap-1">
              {item.isOnDiscount && item.discountPrice && (
                <div className="bg-gradient-to-r from-brand-secondary to-brand-primary text-white text-[10px] font-bold px-2 py-1 rounded-full shadow-md animate-pulse">
                  SALE
                </div>
              )}
              {item.popular && (
                <div className="bg-gradient-to-r from-brand-primary to-amber-500 text-white text-[10px] font-bold px-2 py-1 rounded-full shadow-md">
                  ⭐ POPULAR
                </div>
              )}
            </div>
            
            {!item.available && (
              <div className="absolute top-2 right-2 bg-slate-800 text-white text-[10px] font-bold px-2 py-1 rounded-full shadow-md">
                UNAVAILABLE
              </div>
            )}
            
            {/* Discount Percentage Badge */}
            {item.isOnDiscount && item.discountPrice && (
              <div className="absolute bottom-2 right-2 bg-white/90 backdrop-blur-sm text-brand-secondary text-[10px] font-bold px-2 py-1 rounded-full shadow-md">
                {Math.round(((item.basePrice - item.discountPrice) / item.basePrice) * 100)}% OFF
              </div>
            )}
          </div>
          
          {/* Content: name + price + button on the right */}
          <div className="flex-1 flex flex-col justify-between min-w-0">
            <h4 className="text-base sm:text-lg font-semibold text-slate-900 leading-tight truncate mb-2">
              {item.name}
            </h4>

            <div className="flex items-center justify-between gap-2">
              {/* Price (left) */}
              <div className="flex-1">
                {item.isOnDiscount && item.discountPrice ? (
                  <div className="space-y-0.5">
                    <div className="flex items-center space-x-2">
                      <span className="text-lg sm:text-xl font-bold text-brand-secondary">
                        ₱{item.discountPrice.toFixed(2)}
                      </span>
                      <span className="text-xs sm:text-sm text-slate-500 line-through">
                        ₱{item.basePrice.toFixed(2)}
                      </span>
                    </div>
                  </div>
                ) : (
                  <div className="text-lg sm:text-xl font-bold text-slate-900">
                    ₱{item.basePrice.toFixed(2)}
                  </div>
                )}

                {item.variations && item.variations.length > 0 && (
                  <div className="text-[11px] sm:text-xs text-slate-500">
                    Starting from
                  </div>
                )}
              </div>

              {/* Button / quantity (right) */}
              <div className="flex-shrink-0">
                {!item.available ? (
                  <button
                    disabled
                    className="bg-slate-200 text-slate-500 px-3 py-1.5 rounded-xl cursor-not-allowed text-xs font-medium"
                  >
                    Unavailable
                  </button>
                ) : quantity === 0 ? (
                  <button
                    onClick={handleAddToCart}
                    className="bg-gradient-to-r from-brand-primary to-brand-secondary text-white px-4 py-1.5 rounded-xl hover:from-brand-secondary hover:to-brand-primary transition-all duration-200 transform hover:scale-105 text-xs sm:text-sm font-semibold shadow-md"
                  >
                    {item.variations?.length || item.addOns?.length ? 'Select' : 'Add'}
                  </button>
                ) : (
                  <div className="flex items-center space-x-1 bg-orange-50 rounded-xl p-1 border border-orange-200">
                    <button
                      onClick={handleDecrement}
                      className="p-1.5 hover:bg-orange-100 rounded-lg transition-colors duration-200"
                    >
                      <Minus className="h-3 w-3 text-slate-700" />
                    </button>
                    <span className="font-bold text-slate-900 min-w-[22px] text-center text-xs">
                      {quantity}
                    </span>
                    <button
                      onClick={handleIncrement}
                      className="p-1.5 hover:bg-orange-100 rounded-lg transition-colors duration-200"
                    >
                      <Plus className="h-3 w-3 text-slate-700" />
                    </button>
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Customization Modal */}
      {showCustomization && (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl max-w-md w-full max-h-[90vh] overflow-y-auto shadow-2xl">
            <div className="sticky top-0 bg-white border-b border-gray-200 p-6 flex items-center justify-between rounded-t-2xl">
              <div>
                <h3 className="text-xl font-semibold text-gray-900">Customize {item.name}</h3>
                <p className="text-sm text-gray-500 mt-1">Choose your preferences</p>
              </div>
              <button
                onClick={() => setShowCustomization(false)}
                className="p-2 hover:bg-gray-100 rounded-full transition-colors duration-200"
              >
                <X className="h-5 w-5 text-gray-500" />
              </button>
            </div>

            <div className="p-6">
              {/* Size Variations */}
              {item.variations && item.variations.length > 0 && (
                <div className="mb-6">
                  <h4 className="font-semibold text-gray-900 mb-4">Choose Size</h4>
                  <div className="space-y-3">
                    {item.variations.map((variation) => (
                      <label
                        key={variation.id}
                        className={`flex items-center justify-between p-4 border-2 rounded-xl cursor-pointer transition-all duration-200 ${
                          selectedVariation?.id === variation.id
                            ? 'border-red-500 bg-red-50'
                            : 'border-gray-200 hover:border-gray-300 hover:bg-gray-50'
                        }`}
                      >
                        <div className="flex items-center space-x-3">
                          <input
                            type="radio"
                            name="variation"
                            checked={selectedVariation?.id === variation.id}
                            onChange={() => setSelectedVariation(variation)}
                            className="text-red-600 focus:ring-red-500"
                          />
                          <span className="font-medium text-gray-900">{variation.name}</span>
                        </div>
                         <span className="text-gray-900 font-semibold">
                           ₱{variation.price.toFixed(2)}
                         </span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {/* Add-ons */}
              {groupedAddOns && Object.keys(groupedAddOns).length > 0 && (
                <div className="mb-6">
                  <h4 className="font-semibold text-gray-900 mb-4">Add-ons</h4>
                  {Object.entries(groupedAddOns).map(([category, addOns]) => (
                    <div key={category} className="mb-4">
                      <h5 className="text-sm font-medium text-gray-700 mb-3 capitalize">
                        {category.replace('-', ' ')}
                      </h5>
                      <div className="space-y-3">
                        {addOns.map((addOn) => (
                          <div
                            key={addOn.id}
                            className="flex items-center justify-between p-4 border border-gray-200 rounded-xl hover:border-gray-300 hover:bg-gray-50 transition-all duration-200"
                          >
                            <div className="flex-1">
                              <span className="font-medium text-gray-900">{addOn.name}</span>
                              <div className="text-sm text-gray-600">
                                {addOn.price > 0 ? `₱${addOn.price.toFixed(2)} each` : 'Free'}
                              </div>
                            </div>
                            
                            <div className="flex items-center space-x-2">
                              {selectedAddOns.find(a => a.id === addOn.id) ? (
                                <div className="flex items-center space-x-2 bg-red-100 rounded-xl p-1 border border-red-200">
                                  <button
                                    type="button"
                                    onClick={() => {
                                      const current = selectedAddOns.find(a => a.id === addOn.id);
                                      updateAddOnQuantity(addOn, (current?.quantity || 1) - 1);
                                    }}
                                    className="p-1.5 hover:bg-red-200 rounded-lg transition-colors duration-200"
                                  >
                                    <Minus className="h-3 w-3 text-red-600" />
                                  </button>
                                  <span className="font-semibold text-gray-900 min-w-[24px] text-center text-sm">
                                    {selectedAddOns.find(a => a.id === addOn.id)?.quantity || 0}
                                  </span>
                                  <button
                                    type="button"
                                    onClick={() => {
                                      const current = selectedAddOns.find(a => a.id === addOn.id);
                                      updateAddOnQuantity(addOn, (current?.quantity || 0) + 1);
                                    }}
                                    className="p-1.5 hover:bg-red-200 rounded-lg transition-colors duration-200"
                                  >
                                    <Plus className="h-3 w-3 text-red-600" />
                                  </button>
                                </div>
                              ) : (
                                <button
                                  type="button"
                                  onClick={() => updateAddOnQuantity(addOn, 1)}
                                  className="flex items-center space-x-1 px-4 py-2 bg-gradient-to-r from-red-500 to-red-600 text-white rounded-xl hover:from-red-600 hover:to-red-700 transition-all duration-200 text-sm font-medium shadow-lg"
                                >
                                  <Plus className="h-3 w-3" />
                                  <span>Add</span>
                                </button>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              )}

              {/* Price Summary */}
              <div className="border-t border-gray-200 pt-4 mb-6">
                <div className="flex items-center justify-between text-2xl font-bold text-gray-900">
                  <span>Total:</span>
                  <span className="text-red-600">₱{calculatePrice().toFixed(2)}</span>
                </div>
              </div>

              <button
                onClick={handleCustomizedAddToCart}
                className="w-full bg-gradient-to-r from-red-500 to-red-600 text-white py-4 rounded-xl hover:from-red-600 hover:to-red-700 transition-all duration-200 font-semibold flex items-center justify-center space-x-2 shadow-lg hover:shadow-xl transform hover:scale-105"
              >
                <ShoppingCart className="h-5 w-5" />
                <span>Add to Cart - ₱{calculatePrice().toFixed(2)}</span>
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default MenuItemCard;