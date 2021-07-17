function w=wavelet(x,filterType,xType,boundaryCondition)

if nargin==0
  w.data=[];
  w.h0=[];
  w.h1=[];
  w.f0=[];
  w.f1=[];
  w.filterType=[];
  w.transformType=[];
  w.waveletType=[];
  w.boundaryCondition=[];
  w.hl=[];
  w.hr=[];
  w.fl=[];
  w.fr=[];
  w.level=[];
  w.levelRows=[];
  w.levelCols=[];
  w.maxLevel=[];
  w.coef={};
  w=class(w,'wavelet');
elseif isa(x,'wavelet')
  w=x;
else
  if size(x,1)==1
    x=x(:);
  end
  nx=size(x,1);
  if nargin==1
    filterType='';
    xType='';
    boundaryCondition='';
  elseif nargin==2
    xType='';
    boundaryCondition='';
  elseif nargin==3
    boundaryCondition='';
  end
  if isempty(filterType)
    filterType='binary 13/7';
  end
  if isempty(xType)
    xType='pyramid';
  end
  if ~strcmp(xType,'pyramid') & ~strcmp(xType,'tree')
    error('Unknown wavelet trasform type.')
  end
  if ~isempty(boundaryCondition) & ~(strcmp(boundaryCondition,'symmetric') | strcmp(boundaryCondition,'filters') | strcmp(boundaryCondition,'circular'))
    error('Unknown wavelet trasform type.')
  end
  filterType=filterType(~isspace(filterType));
  ni=find(isletter(filterType));
  if strncmp(filterType(ni),'bin',3)
    ns=findstr(filterType,'/');
    m=str2num(filterType(ni(end)+1:ns-1));
    n=str2num(filterType(ns+1:end));
    [h0,h1,f0,f1]=binary(m,n);
    filterName=['binary ' num2str(m) '/' num2str(n)];
    w.waveletType='biorthogonal symmetric';
    w.boundaryCondition='symmetric';
  elseif strncmp(filterType(ni),'d',1)
    n=str2num(filterType(ni(1)+1:end));
    [h0,h1,f0,f1]=daubechies(n);
    filterName=['daubechies ' num2str(n)];
    w.waveletType='orthogonal';
    if isempty(boundaryCondition)
      w.boundaryCondition='filters';
    else
      w.boundaryCondition=boundaryCondition;
    end
  elseif strncmp(filterType(ni),'s',1)
    n=str2num(filterType(ni(1)+1:end));
    [h0,h1,f0,f1]=symmetric(n);
    filterName=['symmetric ' num2str(n)];
    w.waveletType='orthogonal symmetric';
    if isempty(boundaryCondition)
      w.boundaryCondition='filters';
    else
      w.boundaryCondition=boundaryCondition;
    end
  else
    error('No such filter available')
  end
  w.data=x;
  w.h0=h0;
  w.h1=h1;
  w.f0=f0;
  w.f1=f1;
  w.filterType=filterName;
  w.transformType=xType;
  w.level=0;
  w.levelRows=size(x,1);
  w.levelCols=size(x,2);
  w.maxLevel=pow2(floor(log2(nx)));
  w.coef={x};
  w.hl=[];
  w.hr=[];
  w.fl=[];
  w.fr=[];
  if strcmp(w.boundaryCondition,'filters')
    [w.hl,w.hr,w.fl,w.fr]=edgefilters(h0,h1,f0,f1);
  end
  w=class(w,'wavelet');
end
