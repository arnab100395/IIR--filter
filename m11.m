A = simout2.data;
B = simout3.data; 
% Write this to file.
fid = fopen('Input_vectors.txt','w');
fid_1 = fopen('Output_vectors_matlab.txt','w');
k=size(A,1);
for i = 1:size(A,1)
fprintf(fid,'%d',A(i,:));
fprintf(fid,'\n');
fprintf(fid_1,'%d',B(i,:));
fprintf(fid_1,'\n');
end
fclose(fid);
fclose(fid_1);