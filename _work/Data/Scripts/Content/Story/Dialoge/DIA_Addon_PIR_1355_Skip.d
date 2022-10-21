// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //A kog� to stary Skip znowu widzi!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //Ja ci� znam!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //Zatoka ko�o miasta, pami�tasz?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip? To ty?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //Jak wida�, trudno mnie zapomnie�.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Ale wydaje mi si�, �e jeszcze gdzie� ci� widzia�em...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //A, no tak!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Rysownik si� nie popisa�, ale to by�e� ty.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Ale nie ma o czym gada�. Na swoim li�cie go�czym te� wygl�dam do�� szpetnie.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Mam dla ciebie paczk� od Baltrama.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Mam dla ciebie paczk� od Baltrama.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //Chyba naprawd� potrzebuje rumu, bo po co wysy�a�by towar w taki spos�b?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Oto dwie butelki rumu. Niestety, trzeci� opr�ni�em, czekaj�c tu na niego.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Co tu robisz?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Co tu robisz?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Wr�ci�em z Khorinis i czekam na powr�t kapitana Grega.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "Widzia�em Grega w Khorinis.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Widzia�em Grega w Khorinis.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Naprawd�? Niech to diabli! Co� musia�o p�j�� naprawd� �le!
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Powinien ju� dawno wr�ci� z naszym statkiem.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //Najlepiej b�dzie, je�li wr�c� do Khorinis i poczekam tam na niego...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //Ale nie dzisiaj. Dopiero co wr�ci�em.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			�berfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Mo�esz mnie zabra� do Khorinis?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Mo�esz mnie zabra� do Khorinis?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Nie. Wyruszam p�niej. Najpierw musz� odpocz�� i napi� si� grogu.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Zwariowa�e�? Stracili�my nasz statek, rozumiesz?
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Nie mam zamiaru u�ywa� naszej ostatniej �odzi, aby przewie�� kogo�, komu nie chce si� ruszy� ty�ka!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Ile razy mam powtarza�? Nie!
	};
};

// ************************************************************
// 			 			Banditen + R�stung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Co mo�esz mi powiedzie� o bandytach?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Co mo�esz mi powiedzie� o bandytach?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //Bandytach? Napadaj� nas, ot co!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Niby po co wznosimy t� palisad�?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //To my ich tu przywie�li�my.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Nawet z nimi handlowali�my. �eby� wiedzia�, ile oni maj� z�ota! Ca�e krocie, m�wi� ci!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Byli gotowi p�aci� ka�d� cen� za beczk� rumu.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Ale to ju� nale�y do przesz�o�ci. Teraz trwa wojna!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Co si� sta�o?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Ci dranie nie zap�acili nam za ostatni� dostaw�.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //A wi�c poszed�em do nich, �eby dosta� swoje z�oto.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Kiedy tylko wszed�em na bagna, ci obwiesie rzucili si� na mnie!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //Co gorsza, za�atwili Angusa i Hanka - dw�ch naszych najlepszych �eglarzy!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Nie zapuszczaj si� na bagna, m�wi� ci.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Atakuj� ka�dego, kto wygl�da inaczej ni� oni!
	
	
};

// ------------------------------------------------------------
// 						Banditenr�stung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Potrzebny mi pancerz bandyt�w.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Potrzebny mi pancerz bandyt�w.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Chcesz tam i��? Odbi�o ci do reszty. 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Kiedy bandyci odkryj�, �e nie jeste� jednym z nich, nakarmi� tob� w�e b�otne.
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Wiesz, gdzie m�g�bym znale�� taki pancerz?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //Nigdy si� nie poddajesz, co? Dobrze wi�c. Kiedy� mieli�my jeden taki.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Mo�e wci�� le�y gdzie� w chacie Grega.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Mo�e ci go da, je�li tylko wr�ci...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip podejrzewa, �e zbroja jest w chacie Grega."); 
};

// ------------------------------------------------------------
// 						In Gregs H�tte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "A jak si� dosta� do chaty?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //A jak si� dosta� do chaty?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Spokojnie, ch�opcze!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Chcesz podw�dzi� co�, co nale�y do Grega?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Kiedy kapitan opuszcza� nasz ob�z, poleci� Francisowi pilnowa�, aby nikt nie wchodzi� do jego chaty.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis ma klucz do chaty Grega, ale nie wpu�ci nikogo do �rodka."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					�ber Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Co mo�esz mi powiedzie� o Francisie?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Co mo�esz mi powiedzie� o Francisie?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //To nasz skarbnik.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Kapitan mu bardzo ufa. To dlatego powierzy� mu zast�pstwo.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Chocia� reszta ch�opak�w nie szanuje go zbytnio.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Je�li chcesz wiedzie� wi�cej, pogadaj z Samuelem.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Siedzi w ma�ej jaskini, na p�noc st�d.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //Samuel wie prawie wszystko o prawie wszystkich.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Powinienem porozmawia� z Samuelem. Mo�e b�dzie m�g� mi da� jakie� wskaz�wki."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Spotka�e� kiedy� Kruka?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Spotka�e� kiedy� Kruka?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Pewnie. Sta�em wtedy na stra�y z Henrym. Widzieli�my, jak Kruk zostawia swoich ludzi w wie�y stoj�cej kawa�ek na po�udnie st�d.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Skoro zostawi� ich tak blisko, to na pewno maj� nas szpiegowa�.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //Widzia�em te�, jak obchodzi si� z lud�mi, kt�rzy nie okazuj� pos�usze�stwa.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //Kiedy kto� poka�e cho� cie� niesubordynacji, mo�e straci� g�ow�.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Uwa�aj na Kruka, dobrze ci radz�.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Opowiedz mi co� wi�cej o Angusie i Hanku.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Opowiedz mi co� wi�cej o Angusie i Hanku.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus i Hank mieli spotka� si� z bandytami poza obozem.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Mieli ze sob� wszystko, co tamci zam�wili.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Kut� stal, wytrychy i inne takie rzeczy. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Niestety, nie wr�cili. Te sukinsyny musia�y ich za�atwi�!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan i Bill szukali ich, ale bezskutecznie.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill by� szczeg�lnie smutny, bo Angus i Hank to jego bliscy przyjaciele.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Jest m�ody i s�abo znosi takie wydarzenia.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //Inni przyj�li to ze spokojem. Utrata d�br nie jest niczym wielkim. Ale ten grog, kt�ry nie�li...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //By�o tego ze 20 butelek!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip chce odzyska� 20 butelek grogu, kt�re zabrali mu bandyci.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus i Hank mieli pohandlowa� z bandytami. Od tej pory ich nie widziano.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Poszukiwania Morgana i Billa nie przynios�y efektu...");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "Je�li chodzi o Angusa i Hanka...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Je�li chodzi o Angusa i Hanka...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Tak?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Znalaz�em ich.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Nie �yj�.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //A wi�c jednak. Biedni dranie!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Ale nie liczy�em na nic innego.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Powiniene� zanie�� te smutne wie�ci Billowi, je�li dot�d tego nie zrobi�e�.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Ale nie wal prosto z mostu. Bill jest jeszcze m�ody.
};

// ------------------------------------------------------------
// 			 			Kenne den M�rder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Wiem, kto zamordowa� Angusa i Hanka.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Wiem, kto zamordowa� Angusa i Hanka.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //No i dobrze. Ale to im nie zwr�ci �ycia.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Zemsta to z�y spos�b na zdobycie �up�w.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Najwa�niejsze, �e odzyska�em sw�j grog.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Morderca mnie nie obchodzi! Co z moim grogiem?
	};
};

// ------------------------------------------------------------
// 							Grog zur�ck
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "W sprawie grogu...";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //W sprawie grogu...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Oto twoje 20 flaszek.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Brakuje 20 butelek, tak?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Tak, do cholery! To by� nasz ca�y zapas!
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Oto twoje 20 flaszek.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip odzyska� swoje 20 butelek grogu i jest zadowolony.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Niech mnie kule bij�! Tak za darmo?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //No c�...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //Dobrze, zap�ac� ci.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Masz mo�e co� bardziej interesuj�cego ni� z�oto?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Hmmm... Pomy�lmy... O, mam pier�cie�.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Wygra�em go wiele lat temu w ko�ci w jednej z portowych tawern.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Cz�owiek, kt�ry go przegra�, zapewnia�, �e pier�cie� jest magiczny. Ale nigdy nie mia�em okazji sprawdzi�, czy to prawda.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Chcesz pier�cie� czy z�oto?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Wezm� pieni�dze.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Daj mi pier�cie�.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Daj mi pier�cie�.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Prosz� bardzo.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Wezm� pieni�dze.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Nie ma sprawy.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Masz mo�e co� do sprzedania?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Masz mo�e co� do sprzedania?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Je�li chcesz pohandlowa�, to pogadaj z Garrettem. On zajmuje si� naszymi zapasami.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Powiniene� mi pom�c.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Powiniene� mi pom�c.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //Co jest grane?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Kanion czeka.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Widz�, �e zgromadzi�e� ch�opc�w. Dobra robota! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Lepiej we� paru ch�opak�w!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Kanion jest bardzo niebezpieczny.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Chod� ze mn�.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Chod� ze mn�.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Czekaj. Wr��my do kanionu.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //No to w drog�!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Nie potrzebuj� ju� twojej pomocy.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Nie potrzebuj� ju� twojej pomocy.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //No to id�. Znajdziesz mnie w obozie, jakby co.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //To wystarczaj�co daleko!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Je�li naprawd� chcesz i�� dalej, to bez nas.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Je�li naprawd� chcesz i�� dalej, to beze mnie.
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Je�li zostaniemy rozdzieleni, spotkamy si� przy wodzie.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Idziemy!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Orkowie! Nienawidz� tych bestii!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Wygl�da na to, �e pozbyli�my si� brzytwiak�w.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Mo�emy troch� po�azi� po okolicy, je�li chcesz.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Oczywi�cie musimy zosta� w kanionie. 
	
	AI_StopProcessInfos (self); 
};


