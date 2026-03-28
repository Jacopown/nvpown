-------------------------------------------------------------------------------
-- 1. Impostazioni Generali
-------------------------------------------------------------------------------
vim.g.mapleader = " "         -- Imposta lo spazio come tasto leader principale
vim.g.maplocalleader = " "    -- Imposta lo spazio come tasto leader locale
vim.g.have_nerd_font = true   -- Indica che il terminale supporta le Nerd Font

vim.o.mouse = "a"             -- Abilita il mouse in tutte le modalità
vim.o.undofile = true         -- Salva la cronologia degli "undo" su file
vim.o.undolevels = 10000      -- Numero massimo di modifiche annullabili
vim.o.updatetime = 200        -- Tempo di attesa per triggerare eventi (ms)
vim.o.timeoutlen = 300        -- Tempo di attesa per completare una sequenza di tasti
vim.o.confirm = true          -- Chiede conferma prima di uscire se ci sono modifiche

-- local opt = vim.opt
-- opt.autowrite = true -- Enable auto write
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.spelllang = { "en" }

-------------------------------------------------------------------------------
-- 2. Interfaccia e Visualizzazione
-------------------------------------------------------------------------------
vim.o.number = true           -- Mostra i numeri di riga
vim.o.relativenumber = true   -- Numeri di riga relativi (utile per i salti)
vim.o.cursorline = true       -- Evidenzia la riga dove si trova il cursore
vim.o.signcolumn = "yes"      -- Mostra sempre la colonna laterale (per icone/errori)
vim.o.wrap = false            -- Disabilita l'andata a capo automatica delle righe
vim.o.showmode = false        -- Nasconde l'indicatore della modalità (-- INSERT --) in basso
vim.o.termguicolors = true    -- True color support
vim.o.winborder = 'rounded'

vim.opt.fillchars = {         -- Personalizza i caratteri di riempimento dell'interfaccia
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",                  -- Nasconde i simboli ~ alla fine del file
}

-- opt.conceallevel = 2 -- Hide * markup for bold and italic
-- opt.laststatus = 3 -- Global statusline
-- opt.pumblend = 10 -- Popup blend (menu completamento)
-- opt.pumheight = 10 -- Altezza massima menu completamento
-- opt.list = true -- Show some invisible characters

-------------------------------------------------------------------------------
-- 3. Editor e Indentazione
-------------------------------------------------------------------------------
vim.o.tabstop = 2             -- Numero di spazi per un carattere Tab
vim.o.shiftwidth = 2          -- Numero di spazi per l'indentazione automatica
vim.o.softtabstop = 2         -- Spazi inseriti premendo Tab
vim.o.expandtab = true        -- Trasforma i Tab in spazi reali

-- opt.completeopt = "menu,menuone,noselect"
-- opt.formatoptions = "jcroqlnt"
-- opt.shiftround = true -- Round indent
-- opt.smartindent = true -- Insert indents automatically
-- opt.virtualedit = "block" -- Cursore libero in visual block mode

-------------------------------------------------------------------------------
-- 4. Ricerca e Navigazione
-------------------------------------------------------------------------------
vim.o.ignorecase = true       -- Ignora maiuscole/minuscole nella ricerca
vim.o.smartcase = true        -- Diventa case-sensitive se scrivi una maiuscola
vim.o.inccommand = "split"    -- Mostra in tempo reale l'effetto dei comandi di sostituzione

-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
-- opt.jumpoptions = "view"
-- opt.wildmode = "longest:full,full"

-------------------------------------------------------------------------------
-- 5. Finestre e Layout
-------------------------------------------------------------------------------
vim.o.splitbelow = true       -- Apre i nuovi split orizzontali in basso
vim.o.splitright = true       -- Apre i nuovi split verticali a destra
vim.o.scrolloff = 10          -- Righe minime da mantenere sopra/sotto il cursore
vim.o.sidescrolloff = 10      -- Colonne minime da mantenere ai lati del cursore

-------------------------------------------------------------------------------
-- 6. Folding 
-------------------------------------------------------------------------------
vim.o.foldcolumn = '1'        -- Spazio dedicato per le icone di fold
vim.o.foldlevel = 99          -- Livello iniziale di fold (apre tutto all'avvio)
vim.o.foldlevelstart = 99     -- Assicura che i file si aprano non ripiegati
vim.o.foldenable = true       -- Abilita il sistema di folding

-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- opt.foldmethod = "expr"
-- opt.foldtext = ""

-------------------------------------------------------------------------------
-- 7. Diagnostica
-------------------------------------------------------------------------------
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  virtual_text = {
    prefix = "",
    spacing = 4,
  },
  underline = true,           -- Sottolinea il codice con problemi
  update_in_insert = false,   -- Non aggiornare gli errori mentre scrivi
  severity_sort = true,       -- Mostra prima gli errori più gravi
})

-------------------------------------------------------------------------------
-- 8. Altro (Markdown e Plugin)
-------------------------------------------------------------------------------
vim.g.copilot_enabled = false -- Copilot spento di default all'avvio
-- vim.g.markdown_recommended_style = 0
