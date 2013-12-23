Project 4 README
Conrad Verkler - cverkler

All images are assumed to be singles - used im2single(imread(__))
The naming of horz and vert may be confusing, did my best to explain.

carveHorz: basic seam carving, give image and the amount of seams to remove. Removes vertical seams (changing the width).
carveVert: basic seam carving, give image and the amount of seams to remove. Removes horizontal seams (changing height). Wrapper for carveHorz, just transposes.
carve: seam carving that takes the number of vertical seams (horzDiff) and horizontal seams (vertDiff) to remove from the input image. Calls carveHorz and carveVert (carveHorz first). For ease of use.

precomputeCarveH: performs pre-computation on the image and returns data to be passed to carveHorzFast. Returns a matrix where every pixel has an integer order associated with it which is the order it will be removed in.
precomputeCarveV: performs pre-computation on the image and returns data to be passed to carveVertFast. Wrapper for precomputeCarveH.
precompute: calls both precomputeCarveH and precomputeCarveV (so only need to do one call). returns [pixelOrderH pixelOrderV] for calling carveHorzFast and carveVertFast repectively.

carveVertFast: quickly carves out horizontal seams. Takes the original image, the precomputed vertical data, and the amount to remove. 
carveHorzFast: quickly carves out vertical seams. Takes the original image, the precomputed horizontal data, and the amount to remove. 

growHorz: grow horizontally by inserting vertical seams. Requires precomputed data from precomputeCarveH. Increase width by diff. 
growVert: grow vertically by inserting horizontal seams. Requires precomputed data from precomputeCarveV. Increase height by diff. 

Note on carve__Fast and grow__: both take the optional argument of color at the end. This should be a three dimensional color vector (like [1 0 0] for red). Instead of removing seams carve will instead replace them with the given color. Added scenes in the grow function will be the given color. 