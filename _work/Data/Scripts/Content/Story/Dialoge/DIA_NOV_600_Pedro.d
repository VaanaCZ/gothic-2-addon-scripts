///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Witaj w klasztorze Innosa, nieznajomy.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Jestem Brat Pedro, pokorny sługa Innosa i odźwierny świętego klasztoru.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Co cię do nas sprowadza?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "Masz tu kawałek kiełbasy, Bracie.";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Masz tu kawałek kiełbasy, Bracie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //To miło, że o mnie pomyślałeś. Zwykle nikt o mnie nie pamięta.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Mógłbyś mi dać jeszcze kawałek...
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //Nie ma mowy. Wtedy za mało mi zostanie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //No wiesz? Jeden kawałek! Przecież nikt nie zauważy. Mogę ci dać coś w zamian! Wiem, gdzie rośnie sporo ognistych pokrzyw!
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Jeśli zaniesiesz je Neorasowi, na pewno da ci klucz do biblioteki. Co ty na to?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"Niech będzie. Masz jeszcze jedno pęto.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"Nie ma mowy.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Niech będzie. Masz jeszcze jedno pęto.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //Świetnie. Po drugiej stronie mostu, na lewo i na prawo, rośnie dużo ognistych pokrzyw.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //Nie ma mowy.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Chcesz się podlizać Goraxowi, co? Wszyscy nowicjusze tak robią...
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"Chcę się dostać do klasztoru.";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Chcę się dostać do klasztoru.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Tylko słudzy Innosa mogą wejść do środka.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Jeśli chcesz się pomodlić, poszukaj którejś z przydrożnych kapliczek. Tam również znajdziesz odpowiednią ciszę i spokój.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co mam zrobić, żeby przyjęto mnie do klasztoru?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Co mam zrobić, żeby przyjęto mnie do klasztoru?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Wybrałeś już swoją ścieżkę. Droga do klasztoru jest przed tobą zamknięta.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Jeśli chcesz dołączyć do Bractwa Innosa, musisz poznać reguły klasztoru i wiernie ich przestrzegać.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //Wymagamy ponadto od każdego nowicjusza daniny na rzecz Innosa.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Owcy i tysiąca sztuk złota.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //To dużo pieniędzy.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //To znak, że rozpoczynasz nowe życie jako sługa Innosa. Jeśli zostaniesz przyjęty, wszystkie twoje grzechy zostaną ci wybaczone.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Ale pamiętaj: sługą Innosa zostaje się na całe życie!
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Aby zostać nowicjuszem w klasztorze Innosa, będę potrzebował owcy i ogromnej sumy pieniędzy.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mam tu posążek...";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //Mam tu posążek - jak sądzę, powinien się on znaleźć w klasztorze.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Mogę teraz przejść?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //W tych wyjątkowych okolicznościach masz zgodę na zostanie nowicjuszem.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Nowicjusz Pedro wpuścił mnie do klasztoru, bo przyniosłem zaginiony posążek. Mam go dać komuś w klasztorze."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Obawiam się, że nawet mimo posiadania tego cennego przedmiotu nie masz tutaj wstępu.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Wybrałeś inną ścieżkę rozwoju i droga do klasztoru pozostanie dla ciebie na zawsze zamknięta.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mogę chociaż zostawić tutaj ten posążek?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //Mogę chociaż zostawić tutaj ten posążek?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Oczywiście, natychmiast się nim zajmę. Dziękuję ci za bezinteresowne poświęcenie.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jakich reguł przestrzegają słudzy Innosa?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Jakich reguł przestrzegają słudzy Innosa?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos jest bogiem prawdy i sprawiedliwości, dlatego pod żadnym pozorem nie wolno nam oszukiwać i łamać prawa.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Wystąpienie przeciwko któremuś z braci lub okradanie klasztoru jest karane z całą surowością!
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos jest także bogiem władzy i ognia.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //Jako nowicjusz musisz okazywać szacunek i posłuszeństwo wszystkim Magom Ognia.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Rozumiem.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //Co więcej, obowiązkiem każdego nowicjusza jest praca w klasztorze dla dobra całej społeczności.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Jeśli jesteś gotów przestrzegać tych zasad i złożysz odpowiednią ofiarę, możesz zostać przyjęty do klasztoru jako nowicjusz.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Chcę zostać nowicjuszem.";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Muszę to sobie jeszcze przemyśleć.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Tak, chcę poświęcić swoje życie służbie Innosowi.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Chcę zostać nowicjuszem.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Wybrałeś już ścieżkę, po której kroczysz. Droga magii jest dla ciebie zamknięta.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //Na pewno tego właśnie pragniesz? Wiedz, że wybór ścieżki rozwoju jest ostateczny i nie będziesz go mógł zmienić!
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Widzę, że gotów jesteś złożyć odpowiednią ofiarę. Jeśli nie zmieniłeś zdania, możesz teraz zostać nowicjuszem w klasztorze.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Pamiętaj jednak, że od tej decyzji nie ma odwołania. Musisz mieć pewność, że wybierasz właściwą ścieżkę!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Nie masz jeszcze rzeczy potrzebnych do złożenia ofiary.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Tak, chcę poświęcić swoje życie służbie Innosowi.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //Zatem witaj wśród nas, Bracie. Oto klucz do bramy klasztoru.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //Teraz musisz dobrowolnie otworzyć te odrzwia i przekroczyć próg.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Od dziś jesteś nowicjuszem. Noś tę szatę, by wszyscy wiedzieli, że jesteś jednym z nas.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //W środku zgłoś się do Parlana. Od dziś on będzie się tobą opiekował.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //Czy moje występki zostaną mi zapomniane?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Jeszcze nie. Porozmawiaj z Mistrzem Parlanem. On udzieli ci błogosławieństwa i oczyści z grzechów.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Muszę to sobie jeszcze przemyśleć.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Wróć, gdy uznasz, że jesteś gotowy.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Opowiedz mi o życiu w klasztorze.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Opowiedz mi o życiu w klasztorze.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Celem naszego życia jest służba wielkiemu Innosowi. My, nowicjusze, wykonujemy podstawowe prace, a w wolnych chwilach studiujemy stare pisma.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //Naszymi opiekunami są magowie, którzy zgłębiają sztuki tajemne.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};















