//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Dyrian_EXIT   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 999;
	condition   = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Dyrian_Hello   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_Hello_Condition()
{
	if  (Npc_IsInState (self, ZS_Talk))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Hello_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Hello_13_00"); //(smutn�) Co chce�?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Dyrian_Wurst(C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr			= 3;
	condition	= DIA_Dyrian_Wurst_Condition;
	information	= DIA_Dyrian_Wurst_Info;
	permanent	= FALSE;
	description = "Nem�m �as, mus�m rozd�lovat klob�sy.";
};                       

FUNC INT DIA_Dyrian_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dyrian_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Dyrian_Wurst_15_00"); //Nem�m �as, mus�m rozd�lovat klob�sy.
	AI_Output (self, other, "DIA_Dyrian_Wurst_13_01"); //D�ky. Douf�m, �e to nen� posledn� klob�sa, kterou jsem tu dostal.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Was machst Du hier? 
//**************************************************************************
INSTANCE DIA_Dyrian_Job   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent   = FALSE;
	description = "Co tady d�l�?";
};
FUNC INT DIA_Dyrian_Job_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Dyrian_Hello)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Job_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Job_15_00"); //Co tady d�l�?
	AI_Output (self ,other,"DIA_Dyrian_Job_13_01"); //Poru�il jsem z�kony tohoto spole�enstv�.
	AI_Output (self ,other,"DIA_Dyrian_Job_13_02"); //Te� �ek�m na rozhodnut� nejvy��� rady, jestli budu moci z�stat v kl�te�e.
};
//**************************************************************************
//	Wieso sollst Du das Kloster denn verlassen?
//**************************************************************************

INSTANCE DIA_Dyrian_WhatDone   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent   = FALSE;
	description = "�ekni mi, co se stalo.";
};
FUNC INT DIA_Dyrian_WhatDone_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dyrian_Job))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_WhatDone_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_WhatDone_15_00"); //�ekni mi, co se stalo.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_01"); //Kdy� jsem zametal, vzal jsem knihu z komnat m�g�, abych si ji mohl pozd�ji p�e��st.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_02"); //Mistr Hyglas si toho samoz�ejm� okam�it� v�iml a na tu knihu se m� zeptal.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_03"); //Ze strachu p�ed trestem jsem zalhal - ale pozd�ji m� nachytal s tou knihou v m� cele.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_04"); //Stra�n� se rozzlobil a �ekl o tom nejvy��� rad�. Te� prob�raj�, jestli mohu z�stat.
};

//**************************************************************************
//	Kann ich dir irgendwie helfen?
//**************************************************************************
INSTANCE DIA_Dyrian_CanHelp   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent   = TRUE;
	description = "M��u ti n�jak pomoci?";
};
FUNC INT DIA_Dyrian_CanHelp_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Job)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_CanHelp_15_00"); //Je n�co, jak bych ti mohl pomoci?
	AI_Output (self ,other,"DIA_Dyrian_CanHelp_13_01"); //Ne, odevzdal jsem se na milost Innosovi a m�g�m.
};
//**************************************************************************
//	SC hat die Pr�fung des Feuers angenommen und mit Hyglas gesprochen
//**************************************************************************
INSTANCE DIA_Dyrian_Scroll   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dyrian_Scroll_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	||	(MIS_RUNE == LOG_RUNNING)
	||	(MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_Scroll_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_00"); //Hele, v�n� jsi po�adoval zkou�ku ohn�?
	AI_Output (other,self ,"DIA_Dyrian_Scroll_15_01"); //Ano. A m�m v �myslu ji slo�it.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_02"); //Dobr� - mo�n� bych ti s t�m mohl pomoci. M��u ti d�t velice u�ite�n� kouzeln� svitek. Kouzlo SP�NKU. M� z�jem?

	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Ne, nepot�ebuji tvou pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Co za to chce�?",DIA_Dyrian_Scroll_How);
	Info_AddChoice (DIA_Dyrian_Scroll,"K �emu mi bude?",DIA_Dyrian_Scroll_What);
};
FUNC VOID DIA_Dyrian_Scroll_What ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_00"); //K �emu mi bude?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_01"); //S pomoc� tohohle kouzla m��e� kohokoliv na chv�li uvrhnout do magick�ho sp�nku. Ov�em jenom v p��pad�, �e je jeho v�le slab�� ne� tvoje.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_02"); //To by se mohlo hodit, pokud bude� n�koho pot�ebovat odklidit z cesty.
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_03"); //A jak zjist�m, jestli m� ten doty�n� slab�� v�li ne� j�?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_04"); //Ani se to nenam�hej zkou�et na m�gy. Ale v�t�inu novic� bys tak m�l uspat.
};
FUNC VOID DIA_Dyrian_Scroll_No ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_No_15_00"); //Ne, nepot�ebuji tvou pomoc.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_No_13_01"); //Pokud bys n�hodou zm�nil n�zor, m��e� za mnou kdykoliv p�ij�t.
	Info_ClearChoices (DIA_Dyrian_Scroll);
};
FUNC VOID DIA_Dyrian_Scroll_How ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_How_15_00"); //Co za to chce�?
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_01"); //Ka�d� m�g, kter� u zkou�ky usp�je, m��e m�t jedno p��n�.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_02"); //Pokud se ti opravdu poda�� proj�t zkou�kou ohn�, mo�n� bys mohl za��dit, abych z�stal tady v kl�te�e.
	
	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Ne, nepot�ebuji tvou pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Dobr�, dej mi ten kouzeln� svitek.",DIA_Dyrian_Scroll_Yes);
	
};
FUNC VOID DIA_Dyrian_Scroll_Yes ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_Yes_15_00"); //Dobr�, dej mi ten kouzeln� svitek.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_Yes_13_01"); //P�eji ti hodn� �t�st� u zkou�ky. A� je ti Innos n�pomocen.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
	Log_CreateTopic (Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus (Topic_DyrianDrin,LOG_RUNNING);
	B_LogEntry (Topic_DyrianDrin,"Dyrian mi v�noval svitek s usp�vac�m kouzlem. Na opl�tku se m�m - a� budu m�gem - postarat, aby ho v kl�te�e nechali i nad�le.");
	Info_ClearChoices (DIA_Dyrian_Scroll);
	
};
//**************************************************************************
//	Doch Scroll nehmen
//**************************************************************************
INSTANCE DIA_Dyrian_Doch   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent   = TRUE;
	description = "Zm�nil jsem n�zor. Dej mi to usp�vac� kouzlo.";
};
FUNC INT DIA_Dyrian_Doch_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Scroll)
	&& (MIS_HelpDyrian != LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Doch_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Doch_15_00"); //Zm�nil jsem n�zor. Dej mi to usp�vac� kouzlo.
	AI_Output (self ,other,"DIA_Dyrian_Doch_13_01"); //Dobr�, ale kdy� zkou�kou projde�, za��d�, abych mohl z�stat v kl�te�e.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
};
//*****************************************************************************
//			SC trifft Dyrian, nach Aufnahme und der ist noch im KLoster
//*****************************************************************************
INSTANCE DIA_Dyrian_HelloAgain   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_HelloAgain_Condition()
{
	if  Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_KDF)
	&& (MIS_HelpDyrian == LOG_SUCCESS)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_00"); //(radostn�) D�ky, zachr�nils m�!
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_01"); //(ustra�en�) Ach, promi�, mist�e. Necht�l jsem se vt�rat.
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_02"); //(zdvo�ile) D�kuji ti, �e mohu z�stat zde v kl�te�e. Od t�to chv�le se cel� m�j �ivot zm�n�.
	
	B_GivePlayerXP (XP_Ambient); 	
	AI_StopProcessInfos (self); 
};

//*****************************************************************************
//			Wie gehts? //Info f�r Magier Success 
//*****************************************************************************
func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output (other,self ,"DIA_Dyrian_HowIsIt_15_00"); //Jak se vede?
};

INSTANCE DIA_Dyrian_HowIsIt   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Dyrian_HowIsIt_Condition()
{
	if Npc_KnowsInfo (other,DIA_Dyrian_HelloAgain)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_01"); //Dob�e. M�m zdej�� pr�ci opravdu r�d, mist�e.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Wie gehts? //Info f�r alle anderen 
//*****************************************************************************
INSTANCE DIA_Dyrian_other   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Dyrian_other_Condition()
{
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_NONE)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_02"); //D�kuji Innosovi, �e mohu b�t zde v kl�te�e.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Dyrian steht in Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_Kneipe   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Dyrian_Kneipe_Condition()
{
	if  (MIS_HelpDyrian == LOG_FAILED)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Kneipe_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_01"); //Na co se m� to pt�? Vkl�dal jsem do tebe ve�ker� sv� nad�je, a tys m� nechal na holi�k�ch.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_02"); //Te� u� nem�m nic ne� pit�. A je to tvoje chyba!
	
	Info_ClearChoices (DIA_Dyrian_Kneipe);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Tady m� 5 zla��k�.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice (DIA_Dyrian_Kneipe,"M��u v�echno vysv�tlit.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Pod�vej, co ��k�.",DIA_Dyrian_Kneipe_ShutUp);
		
};

FUNC VOID DIA_Dyrian_Kneipe_Gold ()
{
	AI_Output	(other,self ,"DIA_Dyrian_Kneipe_Gold_15_00"); //Na, tady m� 5 zlat�ch.
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_01"); //(nerv�zn�) 5 zlat�ch? D�v� mi 5 zlat�ch a chce� se tak revan�ovat za to, �es mi zni�il �ivot?
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_02"); //Vezmu si v�echno tvoje zlato!
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0); 
};

FUNC VOID DIA_Dyrian_Kneipe_CanExplain ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_CanExplain_15_00"); //M��u v�echno vysv�tlit.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_01"); //Nech si svoje lacin� v�mluvy.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_02"); //L�e� poka�d�, kdy� otev�e� �sta. Nech m� b�t.
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Dyrian_Kneipe_ShutUp ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_ShutUp_15_00"); //D�vej si pozor na to, co ��k�.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_01"); //Jo, jen do toho, jen m� zastra�uj. To ti nijak nepom��e.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_02"); //�eknu cel�mu sv�tu, co jsi za pokryteckou svini! Hned jak dopiju tuhle fla�ku...
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_03"); //B� mi z o��, je mi z tebe nanic!

	AI_StopProcessInfos (self);
};
//*****************************************************************************
//			Wie gehts? //Info nachher Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_nachher   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent   = TRUE;
	description = "Jak to jde?";
};
FUNC INT DIA_Dyrian_nachher_Condition()
{
	if  Npc_KnowsInfo (other,DIA_Dyrian_Kneipe)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_nachher_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_nachher_15_00"); //Co se stalo?
	AI_Output (self ,other,"DIA_Dyrian_nachher_13_01"); //Aaa, nech m� na pokoji! U� s tebou nechci m�t nic spole�n�ho!
	AI_StopProcessInfos (self);	
};
 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dyrian_PICKPOCKET (C_INFO)
{
	npc			= NOV_604_Dyrian;
	nr			= 900;
	condition	= DIA_Dyrian_PICKPOCKET_Condition;
	information	= DIA_Dyrian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Dyrian_PICKPOCKET_Condition()
{
	C_Beklauen (10, 15);
};
 
FUNC VOID DIA_Dyrian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_BACK 		,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};
	
func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};


