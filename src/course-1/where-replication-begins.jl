### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> title = "Where in the Genome does Replication begin?"
#> date = "2023-06-06"
#> layout = "layout.jlhtml"
#> tags = ["Julia", " Genome", " Replication", " DNA", " ori", "course1"]
#> description = "First part of the first course."

using Markdown
using InteractiveUtils

# ╔═╡ 8115371e-0448-11ee-1fed-1bdc18473098
md"""
# Where in the Genome Does Replication Begin?

Genome replication is a crucial process within cells. Prior to cell division, it is essential for the cell to duplicate its genome, ensuring that each of the resulting daughter cells possesses its own identical copy. The replication process beings in a genomic region called **replication origin** (*ori*).

For the time being, we will consider the case of finding *ori* in bacterial genomes, which mostly consist of a single circular chromosome. To figure out a ori finding method, we will study a case where it's already known to determine what makes a certain region special. DnaA, a protein, plays a crucial role in initiating replication. It accomplishes this by binding to a small segment within the replication origin called a DnaA box.

## Pattern Count

In various biological processes, specific sequences of nucleotides tend to appear more frequently in small regions of the genome. This phenomenon arises because certain proteins can only bind to DNA when a particular nucleotide string is present. The higher the occurrence of the specific string, the greater the likelihood of successful binding. Additionally, a higher frequency of the string reduces the probability of a mutation interfering with the binding process. 

That is why our first plan of action is to count frequent substrings inside a particular region. We will use the term **k-mer** to refer to a string of length *k* and define `Count(Text, Pattern)` as the number of times that a *k-mer* `Pattern` appears as a substring of `Text`.

To compute `PatternCount(Text, Pattern)`, our plan is to “slide a window” down `Text`, checking whether each k-mer substring of `Text` matches `Pattern`. All the pseudocodes will assume **0-based indexing** just as being used in the course.

```
PatternCount(Text, Pattern)
	count ← 0
	for i ← 0 to |Text| − |Pattern|
		if Text(i, |Pattern|) = Pattern
			count ← count + 1
	return count
```
"""

# ╔═╡ 4ef1f649-561e-42dd-9ba6-4737ebd30c13
function PatternCount(Text::String, Pattern::String)
	count = 0
	for i = firstindex(Text):length(Text) - length(Pattern) + 1
		if Text[i:i+length(Pattern)-1] == Pattern
			count = count + 1
		end
	end
	return count
end

# ╔═╡ dfcfc810-8e94-4a75-97be-7e36aebaf6a8
PatternCount("GCGCG", "GCG")

# ╔═╡ Cell order:
# ╟─8115371e-0448-11ee-1fed-1bdc18473098
# ╠═4ef1f649-561e-42dd-9ba6-4737ebd30c13
# ╠═dfcfc810-8e94-4a75-97be-7e36aebaf6a8
