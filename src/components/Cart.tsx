import React from 'react';
import { Trash2, Plus, Minus, ArrowLeft } from 'lucide-react';
import { CartItem } from '../types';

interface CartProps {
  cartItems: CartItem[];
  updateQuantity: (id: string, quantity: number) => void;
  removeFromCart: (id: string) => void;
  clearCart: () => void;
  getTotalPrice: () => number;
  onContinueShopping: () => void;
  onCheckout: () => void;
}

const Cart: React.FC<CartProps> = ({
  cartItems,
  updateQuantity,
  removeFromCart,
  clearCart,
  getTotalPrice,
  onContinueShopping,
  onCheckout
}) => {
  if (cartItems.length === 0) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-12">
        <div className="text-center py-16">
          <div className="text-6xl mb-4">☕</div>
          <h2 className="text-2xl font-display font-semibold text-slate-900 mb-2">Your cart is empty</h2>
          <p className="text-slate-600 mb-6">Add some delicious items to get started!</p>
          <button
            onClick={onContinueShopping}
            className="bg-brand-primary text-white px-6 py-3 rounded-full hover:bg-brand-secondary transition-all duration-200 font-semibold shadow-md"
          >
            Browse Menu
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-8">
        <button
          onClick={onContinueShopping}
          className="flex items-center space-x-2 text-slate-600 hover:text-slate-900 transition-colors duration-200"
        >
          <ArrowLeft className="h-5 w-5" />
          <span>Continue Shopping</span>
        </button>
        <h1 className="text-3xl font-display font-bold text-slate-900">Your Cart</h1>
        <button
          onClick={clearCart}
          className="text-brand-secondary hover:text-red-700 transition-colors duration-200 font-medium"
        >
          Clear All
        </button>
      </div>

      <div className="bg-white rounded-xl shadow-sm overflow-hidden mb-8 border border-slate-100">
        {cartItems.map((item, index) => (
          <div key={item.id} className={`p-4 sm:p-6 ${index !== cartItems.length - 1 ? 'border-b border-slate-100' : ''}`}>
            <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
              <div className="flex-1 min-w-0">
                <h3 className="text-lg font-display font-semibold text-slate-900 mb-1">{item.name}</h3>
                {item.selectedVariation && (
                  <p className="text-sm text-slate-500 mb-1">Size: {item.selectedVariation.name}</p>
                )}
                {item.selectedAddOns && item.selectedAddOns.length > 0 && (
                  <p className="text-sm text-slate-500 mb-1">
                    Add-ons: {item.selectedAddOns.map(addOn => 
                      addOn.quantity && addOn.quantity > 1 
                        ? `${addOn.name} x${addOn.quantity}`
                        : addOn.name
                    ).join(', ')}
                  </p>
                )}
                <p className="text-sm text-slate-600">
                  ₱{item.totalPrice.toFixed(2)} each
                </p>
              </div>
              
              <div className="flex items-end sm:items-center justify-between sm:justify-end space-x-4 sm:space-x-4 sm:ml-4">
                <div className="flex items-center space-x-3 bg-orange-50 rounded-full p-1 border border-orange-200">
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity - 1)}
                    className="p-2 hover:bg-orange-100 rounded-full transition-colors duration-200"
                  >
                    <Minus className="h-4 w-4" />
                  </button>
                  <span className="font-semibold text-slate-900 min-w-[32px] text-center">{item.quantity}</span>
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity + 1)}
                    className="p-2 hover:bg-orange-100 rounded-full transition-colors duration-200"
                  >
                    <Plus className="h-4 w-4" />
                  </button>
                </div>
                
                <div className="text-right">
                  <p className="text-lg font-semibold text-slate-900">
                    ₱{(item.totalPrice * item.quantity).toFixed(2)}
                  </p>
                </div>
                
                <button
                  onClick={() => removeFromCart(item.id)}
                  className="p-2 text-red-500 hover:text-red-600 hover:bg-red-50 rounded-full transition-all duration-200"
                >
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-white rounded-xl shadow-sm p-6">
        <div className="flex items-center justify-between text-2xl font-display font-semibold text-slate-900 mb-6">
          <span>Total:</span>
          <span>₱{getTotalPrice().toFixed(2)}</span>
        </div>
        
        <button
          onClick={onCheckout}
          className="w-full bg-brand-primary text-white py-4 rounded-xl hover:bg-brand-secondary transition-all duration-200 transform hover:scale-[1.02] font-semibold text-lg shadow-md"
        >
          Proceed to Checkout
        </button>
      </div>
    </div>
  );
};

export default Cart;