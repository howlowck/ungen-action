# Ungen action

This action runs [Ungen](https://github.com/howlowck/ungen) in GitHub Workflow and outputs a zipfile

## Inputs

| Name        | Required | Defaults | Description                                         |
| ----------- | -------- | -------- | --------------------------------------------------- |
| `inputDir`  | Yes      | NA       | The Input Directory.                                |
| `outputDir` | Yes      | NA       | The Output Directory (name of the zip file)         |
| `keep`      | No       | `false`  | Whether to keep the UNGEN lines.                    |
| `variables` | No       | `""`     | list of `<key>=<value>` pairs. Separated by newline |

## Outputs

### `pathToOutput`

This is the path to the output zip file.

## Example usage

```yaml
- name: Ungen action step
  uses: howlowck/ungen-action@v0.2
  id: ungen
  with:
    inputDir: "examples/simple-nodejs"
    outputDir: "generated"
    keep: "false"
    variables: |
      useTypescript=false
      appName=MyNewApp
      includeExtraFeature=false
```
