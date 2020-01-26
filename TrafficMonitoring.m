fprintf('Welcome to the Traffic Monitoring System\n'); 

while (true)
    while(true)
        number = input('\nEnter the value:\n1: To detect the density of the Lane\n2: To view the License Plate Number\n3: Exit\n');
        if(number >0 && number <= 3)
            break;
        else
            fprintf("Enter number between 1 - 3\n");
        end
    end
    switch number
        case 1
            fprintf("Please wait while the density is detected\n");
            density = detectDensity(detectObjectsInFrame(100, 148, 'visiontraffic.avi'), 500); 
            fprintf('The density of the lane is : %.2f% ', density);
        case 2
            
            fprintf("Please wait while the License Plate Number gets detected\n");
            NPDetection();
        case 3
            break;
    end
end