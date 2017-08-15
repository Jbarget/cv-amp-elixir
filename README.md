# CVamp

Generate your CV/resume just using a JSON file...

See [here](https://github.com/jbarget) for an example output.

### Getting Started

Prerequisite:
- Elixir already installed

1. Clone the repo: `git clone `
2. Move into the CvAmp directory: `cd CvAmp`
3. Get the dependencies: `mix deps.get`
4. Edit the values in`cv.json` to your info
5. Open the elixir shell: `iex -S mix`
6. Run the programme on your JSON file: `CvAmp.main "cv.json"`
7. You should now have a `cv.html` in the root of the directory
