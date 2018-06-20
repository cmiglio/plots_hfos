clear all
folders={'Basal','Crisis','Sueno'};
k=0;
State=[];
Channel=[];
HIFP=[];
LOFP=[];
fHFO=[];
trough=[];
trough_high=[];
sENT=[];
eSPE=[];
mLPow=[];
mHPow=[];
dur=[];
Electrode=cell(0,1);
Labels=cell(0,1);
for i = 1:length(folders)
    load([folders{i} filesep 'eois.mat'])
    for j = 1:length(eois)
        State(k+1:k+length(eois(j).HIFP),1) = i * ones(length(eois(j).HIFP),1);
        Channel(k+1:k+length(eois(j).HIFP),1) = j * ones(length(eois(j).HIFP),1);
        
        HIFP(k+1:k+length(eois(j).HIFP),1)=eois(j).HIFP;
        LOFP(k+1:k+length(eois(j).HIFP),1)=eois(j).LOFP;
        fHFO(k+1:k+length(eois(j).HIFP),1)=eois(j).freq_HFO;
        trough(k+1:k+length(eois(j).HIFP),1)=eois(j).trough;
        trough_high(k+1:k+length(eois(j).HIFP),1)=eois(j).trough_high;
        sENT(k+1:k+length(eois(j).HIFP),1)=eois(j).s_ent_strans;
        eSPE(k+1:k+length(eois(j).HIFP),1)=eois(j).en_spectra;
        mLPow(k+1:k+length(eois(j).HIFP),1)=eois(j).mLPow;
        mHPow(k+1:k+length(eois(j).HIFP),1)=eois(j).mHPow;
        dur(k+1:k+length(eois(j).HIFP),1)=eois(j).pos(:,2)-eois(j).pos(:,1);
        
        
        nm=regexp(labels{j},'\.','Split');
        
        for n=1:length(eois(j).HIFP)
            Electrode(end+1,1)=nm(1);
            Labels(end+1,1)=labels(j);
        end

        
        k=k+length(eois(j).HIFP);
    end
end

T=table(State,Channel,Electrode,Labels,HIFP,LOFP,fHFO,trough,trough_high,sENT,eSPE,mLPow,mHPow,dur);

writetable(T,'resultados.csv')
