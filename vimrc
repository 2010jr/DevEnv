" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
		colorscheme desert
		" その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
		" 読み込むプラグインの指定
		NeoBundle 'Shougo/neobundle.vim'
		NeoBundle 'tpope/vim-surround'
		" シンタックスチェック系のプラグイン導入
		NeoBundle 'scrooloose/syntastic'
		" git用プラグイン導入
		NeoBundle 'tpope/vim-fugitive.git'
		NeoBundle 'gregsexton/gitv.git'
		

		" 読み込んだプラグインの設定
		" ...
		" solarized カラースキーム
		NeoBundle 'altercation/vim-colors-solarized'
		" mustang カラースキーム
		NeoBundle 'croaker/mustang-vim'
		" wombat カラースキーム
		NeoBundle 'jeffreyiacono/vim-colors-wombat'
		" jellybeans カラースキーム
		NeoBundle 'nanotech/jellybeans.vim'
		" lucius カラースキーム
		NeoBundle 'vim-scripts/Lucius'
		" zenburn カラースキーム
		NeoBundle 'vim-scripts/Zenburn'
		" mrkn256 カラースキーム
		NeoBundle 'mrkn/mrkn256.vim'
		" railscasts カラースキーム
		NeoBundle 'jpo/vim-railscasts-theme'
		" pyte カラースキーム
		NeoBundle 'therubymug/vim-pyte'
		" molokai カラースキーム
		NeoBundle 'tomasr/molokai'
		" カラースキーム一覧表示に Unite.vim を使う
		NeoBundle 'Shougo/unite.vim'
		NeoBundle 'ujihisa/unite-colorscheme'

endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
		if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
				filetype plugin indent off
				if has('vim_starting')
						set runtimepath+=~/.vim/bundle/neobundle.vim/
				endif
				try
						call neobundle#begin(expand('~/.vim/bundle/'))
						call s:LoadBundles()
						call neobundle#end()
				catch
						call s:WithoutBundles()
				endtry 
		else
				call s:WithoutBundles()
		endif

		filetype indent plugin on
		syntax on
endfunction

call s:InitNeoBundle()
colorscheme jellybeans
set nocompatible "vim独自の機能の制限解除"
set number "行番号を表示する
set ruler "カーソル位置表示"
set laststatus=2 "画面最下部のステータスを常に表示する"
set cmdheight=2 "メッセージ表示欄を2行確保" 
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索時にハイライト"

"JavaScriptのシンタックスチェクをjshintで行う設定"
let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックする
