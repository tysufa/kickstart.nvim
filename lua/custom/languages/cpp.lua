local cpp_abr_struct = 'using el = int;<CR><CR>struct noeud{<CR>el val;<CR>noeud * sag;<CR>noeud * sad;<CR><down>;<CR><CR>using arbre = noeud *;'

local cpp_abr_add =
  'void ajouter(el e, arbre & A){<CR>if (A != nullptr){<CR>if (e > A -> val){<CR>ajouter(e, A -> sad);<down><CR>else{<CR>ajouter(e, A -> sag);<down><down><CR>else{<CR>A = new noeud;<CR>A -> val = e;<down><down><CR><CR>'

local cpp_affiche_tab =
  'void affiche_tableau(std::array<,> tab){<CR>std::cout<<"[";<CR>for(int i = 0; i < tab.size()-1; i++){std::cout<<tab[i]<<", ";}<CR>std::cout<<tab[tab.size()-1]<<"]"<<std::endl;<esc><UP><UP>bbblli'

local cpp_abr_show =
  'void abr_show(arbre A, std::string indent){<CR>if (A != nullptr){<CR>abr_show(A->sad, indent+"    ");<CR>std::cout << indent << A -> val << std::endl;<CR>abr_show(A->sag, indent+"    ");'
local cpp_start = '#include <iostream><CR><CR>int main(){<CR><CR><CR>return 0;<up><up><tab>'

local cpp_cout = 'std::cout << << std::endl;<esc>4bi'

local cpp_struct = 'struct {<cr><cr><down>;<esc><up><up><up>w'

vim.api.nvim_create_user_command('Test', 'echo &filetype', {})

if vim.bo.filetype == 'cpp' then
  vim.api.nvim_create_user_command('Abr', 'normal i' .. cpp_abr_struct, { nargs = '*' })
  vim.api.nvim_create_user_command('AbrAdd', 'normal i' .. cpp_abr_add, { nargs = '*' })
  vim.api.nvim_create_user_command('AffTab', 'normal i' .. cpp_affiche_tab, { nargs = '*' })
  vim.api.nvim_create_user_command('AffAbr', 'normal i' .. cpp_abr_show, { nargs = '*' })
  vim.api.nvim_create_user_command('CppStart', 'normal i' .. cpp_start, { nargs = '*' })
  vim.api.nvim_create_user_command('CppCout', 'normal i' .. cpp_cout, { nargs = '*' })
  vim.api.nvim_create_user_command('CppStruct', 'normal i' .. cpp_struct, { nargs = '*' })

  vim.keymap.set('n', '#', '<cmd>CppStart<CR>a', { desc = 'cpp startup file' })
  vim.keymap.set('n', '<leader>cco', '<cmd>CppCout<CR>i', { buffer = 0, desc = '[C]++ [C]o[U]t' })
  vim.keymap.set('n', '<leader>cst', '<cmd>CppStruct<CR>i', { buffer = 0, desc = '[C]++ [S]truc[T]' })

  vim.keymap.set('n', 'cat', '<cmd>AffTab<CR>', { buffer = 0, desc = '[C]++ [A]ffiche [T]ableau' })
  vim.keymap.set('n', 'caa', '<cmd>AbrAdd<CR>', { buffer = 0, { desc = '[C]++ [A]br [A]dd' } })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function(args)
    vim.api.nvim_create_user_command('AbrShow', 'normal i' .. cpp_abr_show, { nargs = '*' })
    vim.api.nvim_create_user_command('Abr', 'normal i' .. cpp_abr_struct, { nargs = '*' })
    vim.api.nvim_create_user_command('AbrAdd', 'normal i' .. cpp_abr_add, { nargs = '*' })
    vim.api.nvim_create_user_command('AffTab', 'normal i' .. cpp_affiche_tab, { nargs = '*' })
    vim.api.nvim_create_user_command('AffAbr', 'normal i' .. cpp_abr_show, { nargs = '*' })
    vim.api.nvim_create_user_command('CppStart', 'normal i' .. cpp_start, { nargs = '*' })
    vim.api.nvim_create_user_command('CppCout', 'normal i' .. cpp_cout, { nargs = '*' })
    vim.api.nvim_create_user_command('CppStruct', 'normal i' .. cpp_struct, { nargs = '*' })

    vim.keymap.set('n', '#', '<cmd>CppStart<CR>a', { buffer = args.buf, desc = 'cpp startup file' })
    vim.keymap.set('n', '<leader>cas', '<cmd>AbrShow<CR>', { buffer = 0, desc = '[C]++ [A]br [S]how' })
    vim.keymap.set('n', '<leader>cco', '<cmd>CppCout<CR>i', { buffer = args.buf, desc = '[C]++ [C]o[U]t' })
    vim.keymap.set('n', '<leader>cst', '<cmd>CppStruct<CR>i', { buffer = args.buf, desc = '[C]++ [S]truc[T]' })

    vim.keymap.set('n', '<leader>cat', '<cmd>AffTab<CR>', { buffer = args.buf, desc = '[C]++ [A]ffiche [T]ableau' })
    vim.keymap.set('n', '<leader>caa', '<cmd>AbrAdd<CR>', { buffer = args.buf, desc = '[C]++ [A]br [A]dd' })
  end,
})
