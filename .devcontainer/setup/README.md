In a devcontainer, you can modify the extensions that are installed by adding or removing them from the .devcontainer/devcontainer.json file. You can also modify user settings by adding a settings.json file to the .devcontainer directory.

Extension ids can be copied from the marketplace into the extensions section:
```jsonc
"extensions": [
	"github.copilot-chat",
	"tintinweb.vscode-inline-bookmarks",
	"DoKca.42-ft-count-line",
	"kube.42header",

	"timonwong.shellcheck",
	"ms-vscode.cpptools",

	// ceedling vscode extensions (disable if not needed)
	"numaru.vscode-ceedling-test-adapter",
	"hbenl.vscode-test-explorer",
	"ms-vscode.test-adapter-converter"
],
"workbench.editorAssociations": [
	{
		"viewType": "vscode.markdown.preview.editor",
		"filenamePattern": "*.md"
	}
]
```