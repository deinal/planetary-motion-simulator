module velocityverlet

  contains 
  function positions(x,y,z,vx,vy,vz,a,t)
    implicit none
    real(16),intent(in) :: x,y,z,vx,vy,vz,a(3),t
    real(16) :: x1,y1,z1,positions(3)
    x1=x+vx*t+0.5*a(1)*t**2
    y1=y+vy*t+0.5*a(2)*t**2
    z1=z+vz*t+0.5*a(3)*t**2
    positions=[x1,y1,z1] 
  end function

  function velocities(vx,vy,vz,a,a1,t)
    implicit none
    real(16),intent(in) :: vx,vy,vz,a(3),a1(3),t
    real(16) :: vx1,vy1,vz1,velocities(3)
    vx1=vx+0.5*(a(1)+a1(1))*t
    vy1=vy+0.5*(a(2)+a1(2))*t
    vz1=vz+0.5*(a(3)+a1(3))*t
    velocities=[vx1,vy1,vz1]
  end function

end module
