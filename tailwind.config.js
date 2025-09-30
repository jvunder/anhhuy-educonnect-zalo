/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: 'rgb(var(--color-primary-rgb) / <alpha-value>)',
          pressed: 'var(--color-primary-pressed)',
          foreground: 'var(--color-primary-foreground)',
        },
        background: {
          DEFAULT: 'var(--color-background)',
        },
        inactive: {
          DEFAULT: 'var(--color-inactive)',
          foreground: 'var(--color-inactive-foreground)',
        },
        text: {
          DEFAULT: 'var(--color-text)',
          secondary: 'var(--color-text-secondary)',
          subtle: 'var(--color-text-subtle)',
        },
        border: {
          DEFAULT: 'var(--color-border)',
        },
        divider: {
          DEFAULT: 'var(--color-divider)',
        },
      },
    },
  },
  corePlugins: {
    preflight: false,
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
  ],
}