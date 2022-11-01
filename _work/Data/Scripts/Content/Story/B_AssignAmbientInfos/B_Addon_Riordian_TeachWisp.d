
///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Riordian_Teach_15_00 ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Teach_15_00"); //Ukaž mi, jak si vycvičit bludičku.
};
func void  B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00 ()
{
	AI_Output	(self, other, "DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00"); //Teď ti tvá bludička může hledat další užitečné věci.
};
func void B_DIA_Addon_Riordian_Teach_10_08 () 
{
	AI_Output 	(self, other, "DIA_Addon_Riordian_Teach1_10_00"); //Bludička ti teď bude hledat věci, které za to stojí. Víc už tě naučit nemohu.
};
func void B_DIA_Addon_Riordian_Teach_10_01 () 
{
	AI_Output	(self, other, "DIA_Addon_Riordian_Teach2_10_00"); //Co by měla tvá bludička hledat?
};
