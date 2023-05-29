---
title: "Software installation"
tags: ["welcome"]
order: 1
layout: "md.jlmd"
---

$(
    begin
        # these special elements will automatically update to read the latest Julia version. See the JavaScript snippet at the bottom of this page to see how it works!
        
        version = html"<auto-julia-version>1.8.2</auto-julia-version>"
        pkg_version = html"<auto-julia-version short>1.8</auto-julia-version>"
    
        nothing
    end
)

# Julia and Pluto Setup

For the installation instructions for Julia and Pluto, I'd like to refer you to the amazing resource by [MIT - Introduction to Computational Thinking](https://computationalthinking.mit.edu/Fall22/installation/). Make sure that you have a working Julia and Pluto setup locally. 


<script defer>
const run = f => f();
run(async () => {
const versions = await (await fetch(`https://julialang-s3.julialang.org/bin/versions.json`)).json()
const version_names = Object.keys(versions).sort().reverse()
const stable = version_names.find(v => versions[v].stable)
console.log({stable})
const pkg_stable = /\\d+\\.\\d+/.exec(stable)[0]
document.querySelectorAll("auto-julia-version").forEach(el => {
    console.log(el)
    el.innerText = el.getAttribute("short") == null ? stable : pkg_stable
})
});
</script>
