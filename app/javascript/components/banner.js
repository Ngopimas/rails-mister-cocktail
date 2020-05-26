import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Are you mixing up this week?", "Try some cocktails and drinks!", "Find here your favorite cocktail recipe."],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
