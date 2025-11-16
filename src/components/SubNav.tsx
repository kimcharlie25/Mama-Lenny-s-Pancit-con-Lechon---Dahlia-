import React from 'react';
import { useCategories } from '../hooks/useCategories';

interface SubNavProps {
  selectedCategory: string;
  onCategoryClick: (categoryId: string) => void;
}

const SubNav: React.FC<SubNavProps> = ({ selectedCategory, onCategoryClick }) => {
  const { categories, loading } = useCategories();

  return (
    <div className="sticky top-16 z-40 bg-white/95 backdrop-blur-md border-b border-gray-100">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center gap-3 overflow-x-auto py-3 scrollbar-hide flex-nowrap">
          {loading ? (
            <div className="flex space-x-4">
              {[1,2,3,4,5].map(i => (
                <div key={i} className="h-8 w-20 bg-gray-200 rounded animate-pulse" />
              ))}
            </div>
          ) : (
            <>
              <button
                onClick={() => onCategoryClick('all')}
                className={`flex-shrink-0 flex items-center justify-center px-3 py-1.5 rounded-full text-sm transition-colors duration-200 border font-medium min-w-[120px] sm:min-w-[140px] ${
                  selectedCategory === 'all'
                    ? 'bg-brand-primary text-white border-brand-primary shadow-sm'
                    : 'bg-white text-slate-700 border-gray-300 hover:border-brand-primary'
                }`}
              >
                All
              </button>
              {categories.map((c) => (
                <button
                  key={c.id}
                  onClick={() => onCategoryClick(c.id)}
                  className={`flex-shrink-0 flex items-center justify-center px-3 py-1.5 rounded-full text-sm transition-colors duration-200 border space-x-1 font-medium min-w-[120px] sm:min-w-[140px] ${
                    selectedCategory === c.id
                      ? 'bg-brand-primary text-white border-brand-primary shadow-sm'
                      : 'bg-white text-slate-700 border-gray-300 hover:border-brand-primary'
                  }`}
                >
                  <span>{c.icon}</span>
                  <span>{c.name}</span>
                </button>
              ))}
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default SubNav;


