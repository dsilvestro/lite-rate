# LiteRate
LiteRate is a program implementing birth-death models within a Bayesian framework to estimates diversification dynamics from cultural occurence data. The model detects statistically-significant rate shifts in the history of the cultural population that theoretically correspond with major historical events and/or the action of evolutionary processes. 

<figure align="center">
<img src="https://github.com/dsilvestro/LiteRate/raw/master/other/Figure_3.png" alt="" width="500" height="700" border="0">
</figure>

# Restricted Models
The repository also contains some more restricted birth-death models for testing hypotheses generated by LiteRate. For now, these include DDRate (rates driven by diversity-dependent competition) and TrendRate (rates driven by exogenous trends).

# Cite
To learn more about methods or if you use these models in published work, please cite both of:

Gjesfjeld, Erik, Daniele Silvestro, Jonathan Chang, Bernard Koch, Jacob G. Foster, and Michael E. Alfaro. ‘A Quantitative Workflow for Modeling Diversification in Material Culture’. PLOS ONE 15, no. 2 (6 February 2020): e0227579. https://doi.org/10.1371/journal.pone.0227579.

Koch, Bernard, Daniele Silvestro, and Jacob G. Foster. n.d. “The Evolutionary Dynamics of Cultural Change (as Told Through the Birth and Brutal, Blackened Death of Metal Music).” SocArXiv. [https://doi.org/10.31235/osf.io/659bt](https://doi.org/10.31235/osf.io/659bt).

# Tutorials
Detailed tutorials explaining the theory and how to use the models are [here](http://www.dysoc.org/cesmodules/diversification_module/) (thanks John Templeton Foundation, Cultural Evolution Society, and National Institute for Mathematical and Biological Synthesis!). If you're lazy the tutorials are linked below:

### [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1_NkXwCDJ5EShuQj3-oEt7jjm1fw2sZXw) Introduction 
  The introduction discusses biological macroevolution and how it motivates cultural macroevolution; highlights questions approachable from a cultural macroevolutionary perspective;    introduces macroevolutionary methods that will be applied in future modules; and lays out the structure of these tutorials.

### [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1_NkXwCDJ5EShuQj3-oEt7jjm1fw2sZXw) 1. Diversity and Diversification. 
  In this tutorial we introduce users to metrics for diversity and diversification rates. We build a simulator to explore the diversification of lineages within a cultural form. Empirically, we contextualize these analyses within diversity of car models that make up American automobiles throughout the 20th century (Gjesfjeld et al. 2020).
 
### [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/16fiaQkQo6Ng7N4YZsBoj3VVEA8HPfPKh) 2. Introduction to Birth-Death Processes and LiteRate.
  In this tutorial we introduce the linear birth-death process as a statistical model for cutting through stochasticity in diversification rates. We also introduce LiteRate, an unsupervised machine-learning algorithm built on birth-death processes designed to identify statistically-signifcant shifts in diversification rates (Silvestro et al., 2019). Finally, we show users how to run LiteRate on their own data. Empirically, the module introduces the diversification of Metal bands active from 1968-2000 as a means to understand the history of the Metal music genre.

### [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1BjltkRQioDaSgLZeDQqhrDB7JC23LUbj) 3. Interpreting LiteRate Results.
This tutorial shows users how to check the convergence of LiteRate's Markov chain Monte Carlo algorithms, as well as how to plot LiteRate results. Empirically, we show how shifts in diversification rates delineate a multi-stage trajectory for the evolution of Metal music over time.
 
 ### [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1bvkNKU_SIX2dZ9nzNmzkeFOtE5Vjm8-_) 4. Modeling Evolutionary Mechanisms in Diversification Rates
In this tutorial we expand our simulator to model evolutionary mechanisms within diversification rates like significant extinctions, key innovations, and competition. We describe how to translate simulations to statistical models, and apply a competition model to the Metal data.
 
### [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1x5Y_5a3glAYF4mU0WGz1BHkgpPiSjCbo) Bonus. Cultural Phylogenies.
This supplemental tutuorial examines the concepts and methods behind the use of phylogenetic approaches. It shows users the types of questions addressable using phylogenies, explains how phylogenies are constructed, and contrasts this approach to diversifcation rate analysis. Empirically, we demonstrate some phylogenetic analyses on a dataset of Austronesia languages (Gray, Drummond and Greenhill 2009). 

# Problems/Questions
If you have issues or questions, you can put a question here or contact Bernie!

### Requirements
LiteRate is written in Python v.3 and requires 
the libraries numpy and scipy. 
Source files and installers are available [here](https://numpy.org) and [here](https://scipy.org). 

Alternatively, you can download the requirements.txt file and use `pip install -r requirements.txt` to install them from the terminal (UNIX systems). Note that if Python v.2 is the default version of Python in your machine you might need to use `python3` to launch the program and `pip3` to install the required libraries. 



