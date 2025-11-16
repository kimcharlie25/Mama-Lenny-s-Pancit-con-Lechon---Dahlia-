import React from 'react';

const Hero: React.FC = () => {
  return (
    <section className="relative bg-gradient-to-br from-orange-50 via-white to-white py-20 px-4">
      <div className="max-w-4xl mx-auto text-center">
        <h1 className="text-5xl md:text-6xl font-display font-extrabold text-slate-900 mb-6 animate-fade-in">
          Comfort Food, Bold Flavors
          <span className="block text-brand-primary mt-2">Mama Lenny&apos;s</span>
        </h1>
        <p className="text-xl text-slate-600 mb-8 max-w-2xl mx-auto animate-slide-up">
          Freshly cooked dishes, generous servings, and homestyle taste in every bite.
        </p>
        <div className="flex justify-center">
          <a 
            href="#ramen"
            className="bg-brand-primary text-white px-8 py-3 rounded-full hover:bg-brand-secondary transition-all duration-300 transform hover:scale-105 font-semibold shadow-lg"
          >
            Explore Menu
          </a>
        </div>
      </div>
    </section>
  );
};

export default Hero;