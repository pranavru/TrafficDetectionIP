function [density] = detectDensity(numOfCars, rangeinMtrs)    
    mtrs = 250;
    if(rangeinMtrs <= mtrs)
        refDensity = 15;
    elseif(rangeinMtrs > mtrs && rangeinMtrs <= (mtrs * 2))
        refDensity = 25;
    elseif(rangeinMtrs > (mtrs * 2) && rangeinMtrs <= (mtrs * 4))
        refDensity = 40;
    elseif(rangeinMtrs > (mtrs * 4))
        refDensity = numOfCars;
    end
    
    density = numOfCars./refDensity * 100;
end