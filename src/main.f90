program planetmotion
use velocityverlet
implicit none
real(16),allocatable :: p(:,:),a(:,:),a1(:,:),m(:),x(:),y(:),z(:),vx(:),vy(:),vz(:)
real(16) :: t,d,ax,ay,az,G=6.67e-11
integer :: i,w,ios,k,l,n,j,b=0,c=0

open(unit=1,file='planets.txt',iostat=ios,status='old')   !reading the input file
  if(ios/=0) then
    print '(a)','Error opening planets.txt'
    stop
  end if
  read(1,*,iostat=ios) n,t,i,w
  allocate(p(n,7),a(n,3),a1(n,3),m(n),x(n),y(n),z(n),vx(n),vy(n),vz(n))
  k=1
  do 
    read(1,*,iostat=ios) m(k),x(k),y(k),z(k),vx(k),vy(k),vz(k)  
    if(ios<0) exit
    p(k,1)=m(k)
    p(k,2)=x(k)
    p(k,3)=y(k)
    p(k,4)=z(k)
    p(k,5)=vx(k)
    p(k,6)=vy(k)
    p(k,7)=vz(k)
        k=k+1
  end do
close(1)

a=0
do k=1,i
  if(modulo(c,w)==0) then  !printing and writing if the interval criterium is met
    open(unit=1,file='plot.dat',iostat=ios,position='append')
    if(ios/=0) then
      print '(a)','Error opening plot.dat'
      stop
    end if
    open(unit=2,file='plot.xyz',iostat=ios,position='append')
    if(ios/=0) then
      print '(a)','Error opening plot.xyz'
      stop
    end if
    b=b+1
    print'(a,i9,a,g15.5,a,i9)','Step: ',k,'   Time: ',k*t,'   Steps written to file: ', b
    write(2,'(i3)') n
    write(2,*)
    do l=1,n
      write(1,'(3g20.10)') p(l,2),p(l,3),p(l,4)
      write(2,'(i3,3g20.10)') l,p(l,2),p(l,3),p(l,4)
      print'(i3,3g20.10)',l,p(l,2),p(l,3),p(l,4) 
    end do
    print*,
    close(1)
  end if
  c=c+1
  do l=1,n  
    p(l,2:4)=positions(p(l,2),p(l,3),p(l,4),p(l,5),p(l,6),p(l,7),a(l,:),t)   !using verlet module to calculate new postions
  end do
  do l=1,n  !iterating new accelerations
    ax=0
    ay=0
    az=0
    do j=1,n
      if(j/=l) then   !don't want to calculate acceleration toward itself                                                       
        d=sqrt((p(l,2)-p(j,2))**2+(p(l,3)-p(j,3))**2+(p(l,4)-p(j,4))**2)
        ax=ax+p(j,1)/d**3*(p(j,2)-p(l,2))
        ay=ay+p(j,1)/d**3*(p(j,3)-p(l,3))
        az=az+p(j,1)/d**3*(p(j,4)-p(l,4))
      end if
    end do
    a1(l,:)=[G*ax,G*ay,G*az]
  end do
  do l=1,n                        
    p(l,5:7)=velocities(p(l,5),p(l,6),p(l,7),a(l,:),a1(l,:),t)     !verlet module to get new velocities
  end do  
  a=a1
end do
print'(a)','Completed'   !Shows when the program is done
end program planetmotion
