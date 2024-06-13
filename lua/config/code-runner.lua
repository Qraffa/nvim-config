local cr = require('code_runner')

cr.setup({
	filetype = {
		cpp = {
			"cd $dir &&",
			"g++ -std=c++11 $fileName -o $fileNameWithoutExt &&",
			"$dir/$fileNameWithoutExt"
		}
	}	
})

