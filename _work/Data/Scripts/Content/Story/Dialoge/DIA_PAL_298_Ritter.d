///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_298_EXIT   (C_INFO)
{
	npc         = PAL_298_Ritter;
	nr          = 999;
	condition   = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Pass		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_Pass_Condition;
	information	 = 	DIA_PAL_298_Pass_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kam vede tahle cesta?";
};
func int DIA_PAL_298_Pass_Condition ()
{	
	if (Kapitel == 1) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_Pass_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Pass_15_00");//Kam vede tahle cesta?
	AI_Output (self, other, "DIA_PAL_298_Pass_09_01");//Za vraty leûÌ pr˘smyk do HornickÈho ˙dolÌ.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_02");//My jsme na tÈhle stranÍ - na tÈ druhÈ se zakopalo nÍkolik sk‚et˘.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_03");//Bude lepöÌ, kdyû se vr·tÌö - tudy neprojdeö.
};
///////////////////////////////////////////////////////////////////////
//	Info TRESPASS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_TRESPASS		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_TRESPASS_Condition;
	information	 = 	DIA_PAL_298_TRESPASS_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_PAL_298_TRESPASS_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_TRESPASS_Info ()
{
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//V·ûnÍ tam chceö jÌt? Ob·v·m se, ûe se moc daleko nedostaneö - na druhÈ stranÍ jsou sk‚eti.
	AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//Pokud do HornickÈho ˙dolÌ vede nÍjak· cesta, tak ji najdu.
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//Dobr·, v tom p‚ÌpadÍ bÍû. Nech„ tÍ Innos doprov·zÌ.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm1		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm1_Condition;
	information	 = 	DIA_PAL_298_Perm1_Info;
	permanent	 = 	TRUE;
	description	 = 	"A co kdyû to p‚ece jenom risknu?";
};
func int DIA_PAL_298_Perm1_Condition ()
{	
	if (Kapitel == 1)
	&& Npc_KnowsInfo (other, DIA_PAL_298_Pass)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm1_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm1_15_00");//A co kdyû to p‚ece jenom risknu?
	AI_Output (self, other, "DIA_PAL_298_Perm1_09_01");//Pak zem‚eö. Proto tady jsme. Abychom tÍ uchr·nili p‚ed tak hloup˝mi n·pady.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm2		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm2_Condition;
	information	 = 	DIA_PAL_298_Perm2_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak se vede?";
};
func int DIA_PAL_298_Perm2_Condition ()
{	
	if  (Kapitel >= 2)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm2_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm2_15_00");//Jak to vypad·?
	AI_Output (self, other, "DIA_PAL_298_Perm2_09_01");//Vöechno v po‚·dku. M·me situaci pod kontrolou.
};


