# Download

```bash
wget https://dl.xpdfreader.com/xpdf-4.03.tar.gz
tar -xf xpdf-4.03.tar.gz
cd xpdf-4.03
```

# Patch

```bash
vim xpdf/GlobalParams.cc
```

```diff
@@ -78,20 +78,20 @@ static struct {
  const char *obliqueFont;	// name of font to oblique
  double obliqueFactor;		// oblique sheer factor
} displayFontTab[] = {
  {"Courier",               "n022003l.pfb", "cour.ttf",    "Courier",      "Courier",                NULL,             0},
  {"Courier",               "NimbusMonoPS-Regular.t1",     "cour.ttf",    "Courier",      "Courier",                NULL,             0},
  {"Courier-Bold",          "n022004l.pfb", "courbd.ttf",  "Courier",      "Courier Bold",           NULL,             0},
  {"Courier-Bold",          "NimbusMonoPS-Bold.t1",        "courbd.ttf",  "Courier",      "Courier Bold",           NULL,             0},
  {"Courier-BoldOblique",   "n022024l.pfb", "courbi.ttf",  "Courier",      "Courier Bold Oblique",   "Courier-Bold",   0.212557},
  {"Courier-BoldOblique",   "NimbusMonoPS-BoldItalic.t1",  "courbi.ttf",  "Courier",      "Courier Bold Oblique",   "Courier-Bold",   0.212557},
  {"Courier-Oblique",       "n022023l.pfb", "couri.ttf",   "Courier",      "Courier Oblique",        "Courier",        0.212557},
  {"Courier-Oblique",       "NimbusMonoPS-Italic.t1",      "couri.ttf",   "Courier",      "Courier Oblique",        "Courier",        0.212557},
  {"Helvetica",             "n019003l.pfb", "arial.ttf",   "Helvetica",    "Helvetica",              NULL,             0},
  {"Helvetica",             "NimbusSans-Regular.t1",       "arial.ttf",   "Helvetica",    "Helvetica",              NULL,             0},
  {"Helvetica-Bold",        "n019004l.pfb", "arialbd.ttf", "Helvetica",    "Helvetica-Bold",         NULL,             0},
  {"Helvetica-Bold",        "NimbusSans-Bold.t1",          "arialbd.ttf", "Helvetica",    "Helvetica-Bold",         NULL,             0},
  {"Helvetica-BoldOblique", "n019024l.pfb", "arialbi.ttf", "Helvetica",    "Helvetica Bold Oblique", "Helvetica-Bold", 0.212557},
  {"Helvetica-BoldOblique", "NimbusSans-BoldItalic.t1",    "arialbi.ttf", "Helvetica",    "Helvetica Bold Oblique", "Helvetica-Bold", 0.212557},
  {"Helvetica-Oblique",     "n019023l.pfb", "ariali.ttf",  "Helvetica",    "Helvetica Oblique",      "Helvetica",      0.212557},
  {"Helvetica-Oblique",     "NimbusSans-Italic.t1",        "ariali.ttf",  "Helvetica",    "Helvetica Oblique",      "Helvetica",      0.212557},
  {"Symbol",                "s050000l.pfb", NULL,          "Symbol",       "Symbol",                 NULL,             0},
  {"Symbol",                "StandardSymbolsPS.t1",        NULL,          "Symbol",       "Symbol",                 NULL,             0},
  {"Times-Bold",            "n021004l.pfb", "timesbd.ttf", "Times",        "Times-Bold",             NULL,             0},
  {"Times-Bold",            "NimbusRoman-Bold.t1",         "timesbd.ttf", "Times",        "Times-Bold",             NULL,             0},
  {"Times-BoldItalic",      "n021024l.pfb", "timesbi.ttf", "Times",        "Times-BoldItalic",       NULL,             0},
  {"Times-BoldItalic",      "NimbusRoman-BoldItalic.t1",   "timesbi.ttf", "Times",        "Times-BoldItalic",       NULL,             0},
  {"Times-Italic",          "n021023l.pfb", "timesi.ttf",  "Times",        "Times-Italic",           NULL,             0},
  {"Times-Italic",          "NimbusRoman-Italic.t1",       "timesi.ttf",  "Times",        "Times-Italic",           NULL,             0},
  {"Times-Roman",           "n021003l.pfb", "times.ttf",   "Times",        "Times-Roman",            NULL,             0},
  {"Times-Roman",           "NimbusRoman-Regular.t1",      "times.ttf",   "Times",        "Times-Roman",            NULL,             0},
  {"ZapfDingbats",          "d050000l.pfb", NULL,          "ZapfDingbats", "Zapf Dingbats",          NULL,             0},
  {"ZapfDingbats",          "D050000L.t1",                 NULL,          "ZapfDingbats", "Zapf Dingbats",          NULL,             0},
  {NULL}
};

@@ -103,6 +103,7 @@ static const char *displayFontDirs[] = {
};
#else
static const char *displayFontDirs[] = {
  "/usr/share/fonts/urw-base35",
  "/usr/share/ghostscript/fonts",
  "/usr/local/share/ghostscript/fonts",
  "/usr/share/fonts/default/Type1",
@@ -2213,7 +2216,7 @@ FILE *GlobalParams::findToUnicodeFile(GS
}

GString *GlobalParams::findFontFile(GString *fontName) {
  static const char *exts[] = { ".pfa", ".pfb", ".ttf", ".ttc" };
  static const char *exts[] = { ".pfa", ".pfb", ".t1", ".ttf", ".ttc" };
  GString *path, *dir;
#ifdef _WIN32
  GString *fontNameU;
```


# Install

```bash
export HPCC_MODULES=/opt/linux/centos/7.x/x86_64/pkgs
source /usr/share/init/profile.sh

module purge
module load base/gcc/8.3.0
module load cmake

if [[ -d build ]]; then
  rm -rf build
fi

mkdir -p build && cd build

export CXX=$(which g++)
export CC=$(which gcc)

cmake -DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/xpdf/4.03 ../ && make && make install
```

