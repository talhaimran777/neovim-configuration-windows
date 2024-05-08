return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    local conf = require('telescope.config').values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set('n', '<M-m>', function()
      harpoon:list():add()
    end)

    vim.keymap.set('n', '<M-e>', function()
      toggle_telescope(harpoon:list())
    end)

    vim.keymap.set('n', '<M-1>', function()
      harpoon:list():select(1)
    end)

    vim.keymap.set('n', '<M-2>', function()
      harpoon:list():select(2)
    end)

    vim.keymap.set('n', '<M-3>', function()
      harpoon:list():select(3)
    end)

    vim.keymap.set('n', '<M-4>', function()
      harpoon:list():select(4)
    end)
  end,
}
