## template

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