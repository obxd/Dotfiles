require'colorizer'.setup(
  {'*';},
  {
    css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
    css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    hsl_fn   = false;        -- CSS hsl() and hsla() functions
    names    = false;        -- "Name" codes like Blue
    rgb_fn   = false;        -- CSS rgb() and rgba() functions
    RGB      = true;         -- #RGB hex codes
    RRGGBBAA = true;         -- #RRGGBBAA hex codes
    RRGGBB   = true;         -- #RRGGBB hex codes
    -- Available modes: foreground, background
    mode     = 'background'; -- Set the display mode.
  })
