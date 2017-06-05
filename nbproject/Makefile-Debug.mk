#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/d6f51a9a/indexed_skiplist.o \
	${OBJECTDIR}/_ext/d6f51a9a/indexed_skiplist_long_int.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/skiplist_batch_test.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/skiplist_batch_tester

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/skiplist_batch_tester: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/skiplist_batch_tester ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/d6f51a9a/indexed_skiplist.o: ../indexed_skiplist/indexed_skiplist.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/d6f51a9a
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d6f51a9a/indexed_skiplist.o ../indexed_skiplist/indexed_skiplist.c

${OBJECTDIR}/_ext/d6f51a9a/indexed_skiplist_long_int.o: ../indexed_skiplist/indexed_skiplist_long_int.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/d6f51a9a
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d6f51a9a/indexed_skiplist_long_int.o ../indexed_skiplist/indexed_skiplist_long_int.c

${OBJECTDIR}/main.o: main.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.c

${OBJECTDIR}/skiplist_batch_test.o: skiplist_batch_test.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/skiplist_batch_test.o skiplist_batch_test.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/skiplist_batch_tester

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
