// Body for the Chrome DevTools MCP `evaluate_script`, not a standalone module.
// Paints the colour to a canvas rather than parsing getComputedStyle, which
// returns oklch() and color-mix() verbatim and cannot be read as RGB.
// Append a call to ratio() for the pair being measured.
const toRGB = (css) => {
  const c = document.createElement('canvas'); c.width = c.height = 1;
  const x = c.getContext('2d', { willReadFrequently: true });
  x.clearRect(0,0,1,1); x.fillStyle = css; x.fillRect(0,0,1,1);
  const d = x.getImageData(0,0,1,1).data;
  return [d[0], d[1], d[2], d[3]/255];
};
const lum = (r,g,b) => { const s=[r,g,b].map(v=>{v/=255; return v<=0.03928? v/12.92 : ((v+0.055)/1.055)**2.4;}); return 0.2126*s[0]+0.7152*s[1]+0.0722*s[2]; };
const ratio = (a,b) => (Math.max(lum(...a),lum(...b))+0.05)/(Math.min(lum(...a),lum(...b))+0.05);
