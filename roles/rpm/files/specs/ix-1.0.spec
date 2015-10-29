# This is a sample spec file for wget

%define _topdir	 	/home/deploy/rpmbuild
%define name			ix
%define release		1
%define version 	1.0
%define buildroot %{_topdir}/%{name}-%{version}-root

BuildRoot:	%{buildroot}
Summary: 		IX Install
License: 		GPL
Name: 			%{name}
Version: 		%{version}
Release: 		%{release}
Source: 		%{name}-%{version}.tar.gz
Prefix: 		/usr
Group: 			Development/Tools

%description
The IX programs helps people book their flights

%prep
%setup -q

%build
#./configure
#make

%install
#make install prefix=$RPM_BUILD_ROOT/usr
cp ix.sh ~/

%files
%defattr(-,root,root)

#%doc %attr(0444,root,root) /usr/local/share/man/man1/demo.1
