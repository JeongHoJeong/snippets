# JeongHoJeong/snippets

- To centralize snippet management and support multiple types of exports (especially VSCode)
- To version control snippets
- To create and edit snippets easier and faster (YAML is much better than JSON when it comes to editing multiline content)

Currently, it's only for VSCode (macOS) and that's just fine for me.

```bash
ruby sync.rb
```

It will aggregate `*.snippet.yml` files in `snippets` directory and create `my.code-snippets` inside VSCode snippets directory.

If you want to use this method with your own snippets, you'd better fork this repo and do version control by yourself. If you don't want to do version control, you can still use `snippets/local` directory, which is already in `.gitignore`.
