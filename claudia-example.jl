include("ComputeSN.jl")
include("OneHybridLeaf.jl")

finalAdjList = Dict{Int64,Array}()

function levelOne(T,L)
	set_SN = retComputeSN(T,L)
	maximumSubsets= maximalSubsets(set_SN,L)
# 	println("maximal subsets=", maximumSubsets)

    N=[]
	for SN in maximumSubsets
		if length(SN)>=3
			# temp=retComputeSN(T,SN)
			# maximumSets=maximalSubsets(temp,L)
			# println(maximumSets)
			L=SN
			levelOne(T,L)
		else
			# tree=
            # TODO pending
# 			println("need to make a tree with these 2 nodes/ make adjacency list")
#             edge with 5 leaf
		end
	end

    if(length(maximumSubsets)==2)
        println("Maximal Subsets", maximumSubsets)
        println("adjList before adding edge=",finalAdjList)
        addVertex(finalAdjList,-1,[-5])

        #TODO get -5 and 5 programmatically
        addVertex(finalAdjList,-5,[5])
        println("adding 5 to adjList", finalAdjList)

        adjMatrix = listToMatrix(parseAdjList2(finalAdjList))
        println(adjMatrix)

    elseif(length(maximumSubsets)>=3)
#         oneHybridLeaf(T_prime,maximumSubsets)
        println("Maximal Subsets", maximumSubsets)
#         println("SetSn",set_SN)

        temp = SNs[3]
        SNs[3]=SNs[2]
        SNs[2]=temp
        println("newSNs==", SNs)

        adjLists = oneHybridLeaf(SNs)

        global finalAdjList = returnConsistentAdjList(adjLists,SNs)

        println("consistentN=",finalAdjList)
    end
    return finalAdjList
end

## Example 1
T= [[1,2,3], [1,2,4], [1,2,5], [2,3,4], [3,4,2], [2,3,5], [3,4,5], [1,3,4],
	[3,4,1], [1,3,5], [1,4,5], [2,4,5],[2,1,3]]
L= [1,2,3,4,5]
net = levelOne(T,L)


## Example 2

