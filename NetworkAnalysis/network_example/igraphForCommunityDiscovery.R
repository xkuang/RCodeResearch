library(igraph)
layout(matrix(c(1,2,3,
 4,5,6),nr = 2, byrow = T))
 
##########################################################
#����ġ�Zachary ���ֵ����ֲ�����Zachary?s Karate Club����
#������[26]��20 ����70 �����Zachary ���������ʱ��۲�����һ����ѧ�Ŀ��ֵ�
#���ֲ��ڲ���Ա���ϵ���硣��Zachary ����Ĺ����У��þ��ֲ���������У����
#Ϊ�Ƿ���߾��ֲ��շѵ������������ִ�����¸þ��ֲ����շ��ѳ��������ֱ�
#��������У��Ϊ���ĵ�С���ֲ�����ģ����Ż����ԣ���ǰѧ�����Ѿ��㷺��Ϊ��
#����������Ż�����ģ���Q=0.419 ��4 �����Ż��֡�
##########################################################
g <- graph.famous("Zachary")
 
##
#? Community structure in social and biological networks
# M. Girvan and M. E. J. Newman
#? New to version 0.6: FALSE
#? Directed edges: TRUE
#? Weighted edges: TRUE
#? Handles multiple components: TRUE
#? Runtime: |V||E|^2 ~ϡ��:O(N^3)
##
system.time(ec <- edge.betweenness.community(g))
print(modularity(ec))
plot(ec, g)
 
#? Computing communities in large networks using random walks
# Pascal Pons, Matthieu Latapy
#? New to version 0.6: FALSE
#? Directed edges: FALSE
#? Weighted edges: TRUE
#? Handles multiple components: FALSE
#? Runtime: |E||V|^2
system.time(wc <- walktrap.community(g))
print(modularity(wc))
#membership(wc)
plot(wc , g)
#? Finding community structure in networks using the eigenvectors of matrices
# MEJ Newman
# Phys Rev E 74:036104 (2006)
#? New to version 0.6: FALSE
#? Directed edges: FALSE
#? Weighted edges: FALSE
#? Handles multiple components: TRUE
#? Runtime: c|V|^2 + |E| ~N(N^2)
system.time(lec <-leading.eigenvector.community(g))
print(modularity(lec))
plot(lec,g)
 
#? Finding community structure in very large networks
# Aaron Clauset, M. E. J. Newman, Cristopher Moore
#? Finding Community Structure in Mega-scale Social Networks
# Ken Wakita, Toshiyuki Tsurumi
#? New to version 0.6: FALSE
#? Directed edges: FALSE
#? Weighted edges: TRUE
#? Handles multiple components: TRUE
#? Runtime: |V||E| log |V|
system.time(fc <- fastgreedy.community(g))
print(modularity(fc))
plot(fc, g)
 
#? Fast unfolding of communities in large networks
# Vincent D. Blondel, Jean-Loup Guillaume, Renaud Lambiotte, Etienne Lefebvre
#? New to version 0.6: TRUE
#? Directed edges: FALSE
#? Weighted edges: TRUE
#? Handles multiple components: TRUE
# Runtime: ��linear�� when |V| \approx |E| ~ sparse; (a quick glance at the algorithm \
# suggests this would be quadratic for fully-connected graphs)
system.time(mc <- multilevel.community(g, weights=NA))
print(modularity(mc))
plot(mc, g)
 
#? Near linear time algorithm to detect community structures in large-scale networks.
# Raghavan, U.N. and Albert, R. and Kumara, S.
# Phys Rev E 76, 036106. (2007)
#? New to version 0.6: TRUE
#? Directed edges: FALSE
#? Weighted edges: TRUE
#? Handles multiple components: FALSE
# Runtime: |V| + |E|
system.time(lc <- label.propagation.community(g))
print(modularity(lc))
plot(lc , g)