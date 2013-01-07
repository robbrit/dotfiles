function OpenPHPManual(keyword)
  let firefox = '/Applications/Firefox.app/Contents/MacOS/firefox-bin'
  let url = 'http://www.php.net/' . a:keyword
  exec '! firefox "' . url . '"'
endfunction
noremap K :call OpenPHPManual(expand('<cword>'))<CR>
