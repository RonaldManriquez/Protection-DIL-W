%This script generates the ranking of each graph.

load graphs_protection.mat
Az=adjacency(G_zachary,'weighted');
Aw=adjacency(G_birds,'weighted');
As=adjacency(G_sandy,'weighted');
Am=adjacency(G_mat72,'weighted');


%%ZACHARY
vertex0_zachary=vertex_importance_wei_prop(G_zachary,0);
vertex05_zachary=vertex_importance_wei_prop(G_zachary,05);
vertex1_zachary=vertex_importance_wei_prop(G_zachary,1);
strenght_zachary=strength(Az);
clos_zachary=centrality(G_zachary,'closeness','Cost',G_zachary.Edges.Weight.^(-1));%closeness_wei(distance_inv_wei(Az));
bet_zachary=betweenness_wei(Az);
lapla_zachary=lap_w(G_zachary);


%WILD
vertex0_birds=vertex_importance_wei_prop(G_birds,0);
vertex05_birds=vertex_importance_wei_prop(G_birds,05);
vertex1_birds=vertex_importance_wei_prop(G_birds,1);
strenght_birds=strength(Aw);
clos_birds=centrality(G_birds,'closeness','Cost',G_birds.Edges.Weight.^(-1));
bet_birds=betweenness_wei(Aw);
lapla_birds=lap_w(G_birds);


%sandy
vertex0_sandy=vertex_importance_wei_prop(G_sandy,0);
vertex05_sandy=vertex_importance_wei_prop(G_sandy,05);
vertex1_sandy=vertex_importance_wei_prop(G_sandy,1);
strenght_sandy=strength(As);
clos_sandy=centrality(G_sandy,'closeness','Cost',G_sandy.Edges.Weight.^(-1));
bet_sandy=betweenness_wei(As);
lapla_sandy=lap_w(G_sandy);


%CAG

vertex0_cag=vertex_importance_wei_prop(G_mat72,0);
vertex05_cag=vertex_importance_wei_prop(G_mat72,05);
vertex1_cag=vertex_importance_wei_prop(G_mat72,1);
strenght_cag=strength(Am);
clos_cag=centrality(G_mat72,'closeness','Cost',G_mat72.Edges.Weight.^(-1));
bet_cag=betweenness_wei(Am);
lapla_cag=lap_w(G_mat72);
 
