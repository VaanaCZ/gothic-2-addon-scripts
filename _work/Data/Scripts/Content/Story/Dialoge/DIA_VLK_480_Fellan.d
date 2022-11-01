///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fellan_EXIT   (C_INFO)
{
	npc         = VLK_480_Fellan;
	nr          = 999;
	condition   = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fellan_PICKPOCKET (C_INFO)
{
	npc			= VLK_480_Fellan;
	nr			= 900;
	condition	= DIA_Fellan_PICKPOCKET_Condition;
	information	= DIA_Fellan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fellan_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Fellan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fellan_PICKPOCKET);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_BACK 		,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
	
func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Tough Guy News 
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_News		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  1;
	condition	 = 	DIA_Fellan_News_Condition;
	information	 = 	DIA_Fellan_News_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Fellan_News_Condition ()
{	
	if  Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_News_Info ()
{
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_00"); //Dobrá, tak jsi mę dostal. To byl ale hrdinský kousek.
	
		 if (MIS_AttackFellan == LOG_RUNNING)
		 && (FellanGeschlagen == FALSE)
		 {
		 	AI_Output (other, self, "DIA_Fellan_News_15_01"); //Tak pâestaneš už do toho bušit, nebo ti mám znovu nandat?
		 	AI_Output (self, other, "DIA_Fellan_News_06_02"); //Ne, už mi neubližuj. Pâestanu. Ale jestli to tady kolem všechno spadne, tak je to jen tvoje chyba!
		 	
		 	FellanGeschlagen = TRUE;
		 	Npc_ExchangeRoutine (self,"OHNEHAMMER");
		 	AI_StopProcessInfos (self);
		 	
		 };
	}; 
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (self, other, "DIA_Fellan_News_06_03");  //Co se dęje? Chceš další ránu pęstí?
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_04"); //Co seš to za blázna? Bojuj, nebojuj, âekni - co vlastnę chceš?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_HALLO		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  2;
	condition	 = 	DIA_Fellan_HALLO_Condition;
	information	 = 	DIA_Fellan_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Proč do toho tak mlátíš?";
};
func int DIA_Fellan_HALLO_Condition ()
{	
	if (FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Fellan_HALLO_15_00"); //Proč tady do toho mlátíš?
	AI_Output (self, other, "DIA_Fellan_HALLO_06_01"); //Nękolik posledních dní se zoufale snažím zamezit tomu, aby mi zatýkalo do domu.
	AI_Output (self, other, "DIA_Fellan_HALLO_06_02"); //Krov se mi drobí pokaždý, když pâijde vętší liják. Takže se mi všechno rozsejpá pod rukama!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_Stop		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr 			 =  3;
	condition	 = 	DIA_Fellan_Stop_Condition;
	information	 = 	DIA_Fellan_Stop_Info;
	permanent	 =  FALSE;
	description	 = 	"Můžeš s tím boucháním pâestat?";
};

func int DIA_Fellan_Stop_Condition ()
{
	if (MIS_AttackFellan == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fellan_Stop_Info ()
{
	AI_Output (other, self, "DIA_Fellan_Stop_15_00"); //Můžeš pâestat s tím boucháním?
	AI_Output (self, other, "DIA_Fellan_Stop_06_01"); //Ne, musím to dodęlat.
	
	Info_ClearChoices (DIA_Fellan_Stop);
	Info_AddChoice (DIA_Fellan_Stop,"Pâestaŕ s tím, nebo ti zpâerážím všechny kosti v tęle.",DIA_Fellan_Stop_Bones);
	Info_AddChoice (DIA_Fellan_Stop,"Dám ti 10 zlatých, když s tím rámusem pâestaneš.",DIA_Fellan_Stop_Gold);
	Info_AddChoice (DIA_Fellan_Stop,"Prostę pâestaŕ bušit, jasný?",DIA_Fellan_Stop_Just);
};
FUNC VOID DIA_Fellan_Stop_Bones()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Bones_15_00"); //Pâestaŕ s tím, nebo ti zpâerážím všechny kosti v tęle.
	AI_Output (self, other, "DIA_Fellan_Stop_Bones_06_01"); //Zapomeŕ na to, nebo ti do tvý palice svym kladivem vtluču alespoŕ trochu rozumu.
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Fellan_Stop_Gold()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Gold_15_00"); //Dám ti 10 zlatých, když s tím rámusem pâestaneš.
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_01"); //Hej... To je od tebe opravdu milý. Ale jako s tim zlatem, můžeš...
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_02"); //...fajn, ty víš, co se s tim dá dęlat.
};
FUNC VOID DIA_Fellan_Stop_Just()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Just_15_00"); //Prostę pâestaŕ bušit, fajn?
	AI_Output (self, other, "DIA_Fellan_Stop_Just_06_01"); //Prostę mę zkus neposlouchat, fajn?
};
///////////////////////////////////////////////////////////////////////
//	Info Alles klar?
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_klar		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  5;
	condition	 = 	DIA_Fellan_klar_Condition;
	information	 = 	DIA_Fellan_klar_Info;
	permanent	 =  TRUE;
	description	 = 	"Halóóó - jsi v pohodę?";
};
func int DIA_Fellan_klar_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Fellan_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fellan_klar_Info ()
{
	AI_Output (other, self, "DIA_Fellan_klar_15_00"); //Halóóó - je ti dobâe?
	
	if (FellanGeschlagen == FALSE) 
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_01"); //Fajn, jestli se mi podaâí tohle všechno včas opravit.
	}
	else
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_02"); //Ta stâecha je čím dál tím horší. Až pâíštę zaprší, bude mi voda téct rovnou na hlavu. A za to všechno můžeš ty!
	};
	AI_StopProcessInfos (self);
};
//Kapitel 2 Miliz Kandidat 





