///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"Jesteś Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Jesteś Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Skąd wiesz, jak się nazywam?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Szuka cię sędzia. Uciekłeś z więzienia.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Jakie popełniłeś przestępstwo? Ukradłeś mu sakiewkę?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Nie jemu. Gubernatorowi. I to w dodatku na polecenie sędziego.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Po tym jak zaatakowaliśmy gubernatora, nie chciał się z nami podzielić łupem, więc kazał nas aresztować.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //Ponieważ nie chcieliśmy skończyć na szubienicy, postanowiliśmy uciec.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //Sądziliśmy, że nigdy nie zdołają nas złapać. Najwyraźniej się pomyliliśmy.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Przestań jęczeć i stawaj do walki.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Czy możemy w jakiś sposób zdemaskować sędziego?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Sędzia kazał mi was zabić.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"Znalazłem Morgaharda, przywódcę zbiegów."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //Sędzia kazał mi was zabić.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Tak. Domyśliłem się, że po to tu przyszedłeś.

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Czy możemy w jakiś sposób zdemaskować sędziego?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Nie. To niemożliwe. Mądrala siedzi w górnym mieście i tylko pociąga za sznurki. Jest nietykalny.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Nie byłbym tego taki pewien. Potrzebny nam tylko jakiś dowód jego udziału w zbrodni.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Dowód, powiadasz? Mam dowód. Ale kto chciałby słuchać takiego recydywisty?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Przekaż mi ten dowód, a dopilnuję, aby nikt już więcej na ciebie nie polował.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Jesteś pewien, że chcesz się w to mieszać? Dobrze, proszę. Oto list z podpisem sędziego.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Nawet jeśli nie oczyści mnie to z zarzutów, w zupełności wystarczy, aby obciążyć częścią winy sędziego.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard dał mi list od sędziego, z którego jasno wynika, że ten ostatni jest odpowiedzialny za obrabowanie Gubernatora Lariusa. Sądzę, że właśnie o taki dowód prosił mnie Lee."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Przestań jęczeć i stawaj do walki. Najwyższy czas położyć temu kres.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Jeśli o mnie chodzi, to i tak nie mam nic do stracenia.
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Mam nadzieję, że kiedyś zobaczę tę świnię, sędziego, dyndającego na stryczku.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Czemu po prostu nie zostawisz mnie w spokoju?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};


