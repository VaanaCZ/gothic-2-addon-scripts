// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Hej, co tu si� sta�o?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //Pobi�em Franka.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //No i co? To teraz TY musisz zadba�, by te lenie odwala�y swoj� robot�.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Hej, nie zamierzam marnowa� tu czasu. Chc� wej�� do obozu.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Nie teraz. Pokona�e� Franka. Czyli jeste� nowym przyw�dc�. No to r�b swoje.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Skoro jestem przyw�dc�, to mog� wybra� nast�pn� osob�, kt�ra wejdzie do obozu.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //No to m�wi�, �e nast�pny mam by� JA.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //To nie takie proste. Nie potrzebujemy nikogo nowego, wi�c nikt nie wejdzie do �rodka.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus mo�e wys�a� nowego przyw�dc� my�liwych, zwalniaj�c tym samym w obozie miejsce dla mnie.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //Nie poddajesz si�, co? Dobra, pakuj do obozu swoje cztery litery.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus si� tym zajmie i przy�le nowego przyw�dc�.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //No to na co czekasz? Nie zapomnij zabra� kilofa.
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Hej, kim jeste�? Nie mog� sobie wyobrazi�, �eby kto� taki jak ty mia� pozwolenie na wej�cie.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Franko mnie przysy�a�. Chce wiedzie�, czy nie potrzeba nowych robotnik�w.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Tak, w zasadzie potrzeba. Wczoraj jeden go�� strzeli� w kalendarz.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Ten idiota zdenerwowa� Estebana.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Kto to jest Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //To szef obozowiska. On decyduje, komu pozwoli� na wej�cie do kopalni.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Powiedz Frankowi, �e Thorus prosi o nowego robotnika. Jasne?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus potrzebuje nowego cz�owieka do obozu. To zainteresuje Franka.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? TEN Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? Pierwsze s�ysz�...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Hej, st�j! Nie wejdziesz tam, wi�c zje�d�aj.
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus? TEN Thorus?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Tak. TEN Thorus. Cz�owiek, kt�ry prosi o nowych robotnik�w.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //Cz�owiek, kt�ry decyduje, czy kto� nowy mo�e przej�� z bagien do obozu.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //Nie chcesz mi chyba powiedzie�, �e znasz go z wcze�niejszych czas�w?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //No c�... Tak.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Rozumiem... KA�DY zna Thorusa.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Niemniej jednak to ci wcale nie pomo�e. I nie zamierzam przekazywa� �ADNYCH wiadomo�ci.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus? Pierwsze s�ysz�...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Oj, ch�opie, nie znasz go? By� dow�dc� stra�nik�w w Starym Obozie.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //Jest cz�owiekiem, kt�rego wszyscy szanuj� i kt�remu ufaj�.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //On mo�e poprosi� o nowych ludzi.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Je�li po�yjesz dostatecznie d�ugo, to b�dziesz mia� okazj� go pozna�.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Zr�b jeszcze jeden krok bli�ej, a b�dzie to tw�j ostatni!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Niekt�rzy nigdy si� nie naucz�...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "Jestem tym nowym.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //Jestem tym nowym.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Nie pr�buj sobie ze mnie �artowa�. Decyzja o tym, kto mo�e wej�� do obozu, wci�� nale�y do Franko.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "To w�a�nie Franko mnie przys�a�...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //To w�a�nie Franko mnie przys�a�...
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //Nie zrobi� tego. A teraz zje�d�aj, bo porachuj� ci gnaty.
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "I jak? Wszystko w porz�dku?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //I jak? Wszystko w porz�dku?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Wszystko dobrze - przynajmniej dop�ki kto� niepowo�any nie pr�buje si� dosta� do �rodka.
	
	AI_StopProcessInfos (self);
};


