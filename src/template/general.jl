## template

## binary search
function search_left_border(left::Int, right::Int, key::Function)
    ## e.g. search_left_border(1, 10, >(3)) | returns 4
    while left <= right
        mid = left + (right - left) >> 1
        if key(mid) ## lies in the right part
            right = mid - 1
        else
            left = mid + 1
        end
    end
    left
end

## segment tree
mutable struct SegmentTree{T<:Real}
    n::Int
    tree::Vector{T}
    
    function SegmentTree(nums::Vector{T}) where T
        n = length(nums)
        tree = append!(zeros(Int, n - 1), nums)
        for i in (n - 1):-1:1
            tree[i] = tree[i << 1] + tree[i << 1 | 1]
        end
        new{T}(n, tree)
    end
end

function update!(ST::SegmentTree, ind::Int, val::Int)::Nothing
    tree = ST.tree
    ind += ST.n - 1
    delta = val - tree[ind]
    while ind > 0
        tree[ind] += delta
        ind >>= 1
    end
end

function sum_range(ST::SegmentTree, left::Int, right::Int)::Int
    left += ST.n - 1
    right += ST.n - 1
    res, tree = 0, ST.tree
    while left <= right
        if isodd(left) ## right child
            res += tree[left] ## record outside value
            left += 1
        end
        left >>= 1
        if iseven(right) ## left child
            res += tree[right] ## record outside value
            right -= 1
        end
        right >>= 1
    end
    res
end

## merge sort
function merge_sort(arr::AbstractArray)::AbstractArray
    (n = length(arr)) == 1 && return arr
    mid = n >> 1
    lpart = merge_sort(@view(arr[1:mid]))
    rpart = merge_sort(@view(arr[mid + 1:end]))
    return merge_sorted(lpart, rpart)
end

function merge_sorted(lpart::AbstractArray{T}, rpart::AbstractArray{T})::AbstractArray{T} where T
    l1, l2 = length(lpart), length(rpart)
    combined = Array{T}(undef, l1 + l2)
    p1 = p2 = 1
    for pos in eachindex(combined)
        if p2 > l2 || p1 <= l1 && lpart[p1] <= rpart[p2]
            combined[pos] = lpart[p1]
            p1 += 1
        else
            combined[pos] = rpart[p2]
            p2 += 1
        end
    end
    combined
end