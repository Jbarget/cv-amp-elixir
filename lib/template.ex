defmodule Amp.Template do
  @moduledoc false
  def opening_tags do
    """
    <!DOCTYPE html>
    <html amp>
    <head>
    <link rel="canonical" href="self.html" />
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.7.0/css/tachyons.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
    <style>.min-vh-22{min-height: 22vh;}.min-vh-6{min-height: 6vh;}</style>
    <script async src="https://cdn.ampproject.org/v0.js"></script>
    """
  end

  def get_basic(html, data) do
    html <> """
    <header class="tc bg-light-green pa2">
      <div class="inline-flex items-center">
        <amp-img class="br-100" width="150" height="150" src="#{data["image"]}" alt="#{data["first_name"]} #{data["last_name"]} profile image">
        <noscript>
          <img class="br-100" src="#{data["image"]}" width="150" height="150" />
        </noscript>
        </amp-img>
        <h1 class="ml3 f3 fw3">#{data["first_name"]} #{data["last_name"]} </h1>
      </div>
      <p class="pl2 pr2">#{data["intro"]}</p>
    </header>
    """
  end

  def get_skills(html, data) do
    skills_html = data
    |> Enum.map(fn(skill) ->
      """
      <li class="ba br-pill b--black-10 di pa2 ma2 ">#{skill}</li>
      """
    end)
    |> Enum.join(" ")

    html <> "<ul class='list flex flex-wrap pl0 justify-center'>" <> skills_html <> """
    </ul>
    <div class="ba b--light-gray ma2"></div>
    <div class="pa2 fw3">
    """
   end

  def get_work(html, data) do
    work_html = data
    |> Enum.map(fn(placement) ->
      """
      <div class="w-50-ns w-100 pl2 pr2 tc">
        <div>
          <p class="di-l underline">#{placement["company"]}</p>
          <p class=" di-l black-40 no-underline">#{placement["from_to"]}</p>
        </div>
        <p>#{placement["details"]}</p>
      </div>
      """
     end)
    |> Enum.join(" ")

    html <>
    """
      <div>
        <h2 class='ttu fw4 tc'>Work</h2>
        <div class='flex flex-wrap justify-center'>
    """ <> work_html <> "</div>"
  end

  def get_projects(html, data) do
    projects_html = data
    |> Enum.map(fn(project) ->
      """
      <div class="w-50-ns w-100 min-vh-22 tc">
        <div>
          <p class="di-l">#{project["name"]}:</p>
          <p class=" di-l black-40 no-underline"> #{project["stack"]}</p>
        </div>
        <p class="pl2 pr2">#{project["details"]}</p>
      </div>
      """
    end)
    |> Enum.join(" ")

    html <>
    """
      <div>
        <h2 class='ttu fw4 tc mb4'>Projects</h2>
        <div class='flex flex-wrap justify-center'>
    """ <> projects_html <> "</div></div>"
  end

  def get_education(html, data) do
    education_html = data
    |> Enum.map(fn(education) ->
      """
      <div class="tc">
        <p>#{education["name"]}</p>
        <p>#{education["details"]}</p>
      </div>
      """
     end)
    |> Enum.join(" ")

    html <> "<div class='pa2'><h2 class='ttu fw4 tc'>Education</h2>" <> education_html <> "</div>"
  end

  def get_extra_curricular(html, data) do
    extra_curricular_html = data
    |> Enum.map(fn(extra) ->
      """
        <li class="fl w-50-ns w-100 min-vh-6 pr4">#{extra}</li>
      """
    end)
    |> Enum.join(" ")

    html <> "<div><h2 class='ttu fw4 tc'>Extra Things</h2><ul class='cf pr3'>" <> extra_curricular_html <> "</ul></div>"
  end

  def get_references(html, data) do

    references_html = data
    |> Enum.map(fn(reference) ->
      """
      <div class="tc">
        <p>#{reference["name"]}</p>
        <p>#{reference["comment"]}</p>
      </div>
      """
    end)
    |> Enum.join(" ")

    html <> "<div class='pa2'><h2 class='ttu fw4 tc'>References</h2>" <> references_html <> "</div></div>"
  end

  def head(html, data) do
    html <> """
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
    <title>#{data["title"]}</title>
    """
  end

  def closing_head_opening_body_tags(html) do
    html <> """
    </head>
    <body class="helvetica fw3">
    """
  end

  def body(html, data \\ %{}) do

    get_basic(html, data["basic"])
    |> get_skills(data["skills"])
    |> get_work(data["work"])
    |> get_projects(data["projects"])
    |> get_extra_curricular(data["extra_curricular"])
    |> get_education(data["education"])
    |> get_references(data["references"])

  end

  def closing_tags(html) do
    html <> """
    <footer class="f6 tc bg-light-green ma0 pa2">Made with Google AMP ⚡</footer>
    </body>
    </html>
    """
  end
end
