


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenNW_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_EXIT_Condition;
	information	= DIA_MiltenNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenNW_EXIT_Condition()
{
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_MiltenNW_KAP3_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP3_EXIT_Condition;
	information	= DIA_MiltenNW_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*************************************************************
//Hallo!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Hello(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_Hello_Condition;
	information	= DIA_MiltenNW_KAP3_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_MiltenNW_KAP3_Hello_Condition()
{
	if hero.guild == GIL_PAL
	|| hero.guild == GIL_DJG
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Hello_Info()
{	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_00"); //A� trudno w to uwierzy�... Naprawd� jeste� teraz paladynem?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_01"); //Jak widzisz...
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_02"); //Ho, ho! Maj�c kogo� takiego po swojej stronie, nie musimy si� ju� chyba obawia� armii Beliara!
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_03"); //Kto�, kto rozprawi� si� ze �ni�cym, nie b�dzie mia� k�opot�w z byle garstk� ork�w.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_04"); //Orkowie to najmniejsze z naszych zmartwie�.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_05"); //Tak, wiem... ale dobrze ci� mie� po naszej stronie.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_06"); //W porz�dku.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_07"); //Co robisz w klasztorze? Czekaj, niech zgadn�. Chcesz pobiera� nauki od Mag�w Ognia?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_08"); //By� mo�e.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_09"); //Wiedzia�em! Najlepiej porozmawiaj z Mardukiem. To on zajmuje si� zwykle paladynami. Znajdziesz go przed kaplic�.
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_10"); //Widz�, �e plotki nie k�ama�y.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_11"); //Jakie plotki?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_12"); //Te, wedle kt�rych do��czy�e� do �owc�w smok�w.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_13"); //C�, ch�tniej bym ci� widzia� w stroju maga lub paladyna, ale przynajmniej walczysz po naszej stronie.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_14"); //To wszystko, co masz mi do powiedzenia?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_15"); //Oczywi�cie ciesz� si�, �e ci� widz�. S�dz�c po twoim wygl�dzie, orkowie powinni ju� zacz�� si� ba�.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_16"); //Orkowie s� teraz najmniejszym z naszych zmartwie�.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_17"); //Wiem, ale mimo wszystko s� gro�ni. A ty...
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_18"); //Ty pokona�e� �ni�cego. Twoja pomoc b�dzie nieoceniona.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_19"); //W porz�dku.
	};		
};	

// ************************************************************
// 	  				   Was machst du hier am Kloster
// ************************************************************

INSTANCE DIA_MiltenNW_Monastery(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_Monastery_Condition;
	information	= DIA_MiltenNW_Monastery_Info;
	permanent	= FALSE;
	description = "Jakim cudem uda�o ci si� tak szybko dosta� do klasztoru?";
};                       
FUNC INT DIA_MiltenNW_Monastery_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_Monastery_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Monastery_15_00"); //Jakim cudem uda�o ci si� tak szybko dosta� do klasztoru?
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_01"); //G�upie pytanie! Prze�lizgn��em si� przez prze��cz i uda�em si� wprost do klasztoru.
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_02"); //Omini�cie niekt�rych z pilnuj�cych prze��czy bestii nie by�o proste, ale koniec ko�c�w, posz�o mi �atwiej, ni� si� spodziewa�em.
};

// ************************************************************
// 	  				   Weisst du wo die Anderen sind?
// ************************************************************

INSTANCE DIA_MiltenNW_FourFriends(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_FourFriends_Condition;
	information	= DIA_MiltenNW_FourFriends_Info;
	permanent	= FALSE;
	description = "Wiesz mo�e, gdzie s� pozostali?";
};                       
FUNC INT DIA_MiltenNW_FourFriends_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_FourFriends_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_00"); //Wiesz mo�e, gdzie s� pozostali?
	if (Npc_IsDead (PC_FIGHTER_NW_vor_DJG) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_01"); //Gorn ca�kiem nie�le zni�s� pobyt w wi�zieniu Garonda.
		
		if (MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_02"); //Jak uda�o mu si� z niego wydosta�?
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_03"); //Musia�em troch� ok�ama� Garonda i w ko�cu wycofa� wszystkie oskar�enia.
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_04"); //Tylko niech to b�dzie nasza tajemnica, jasne?
		};
		
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_05"); //W ka�dym razie - zamierza� zajrze� do Lee i dowiedzie� si�, co s�ycha� na farmie.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_06"); //Jak go znam, odbija sobie teraz z nawi�zk� d�ugie dni postu w wi�zieniu. Za�o�� si�, �e nie�le ju� spustoszy� spi�arni� najemnik�w.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_07"); //Gornowi niestety si� nie uda�o.
	};
	if (Npc_IsDead (PC_THIEF_NW) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_08"); //Diego mamrota� co� o wyr�wnaniu rachunk�w, ale nie wiem, o co mu chodzi�o.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_09"); //Podejrzewam, �e wr�ci� do miasta. Znasz go przecie� - zawsze szuka okazji do zarobku.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_10"); //Diego nie mia� tyle szcz�cia. Pozosta� wi�niem Bariery.
	};
};
//*************************************************************
//Ich muss ins Kloster //HauptStory!!!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Entry(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 32;
	condition	= DIA_MiltenNW_KAP3_Entry_Condition;
	information	= DIA_MiltenNW_KAP3_Entry_Info;
	permanent	= TRUE;
	description = "Musz� si� dosta� do klasztoru. To bardzo pilne!";
};                       
FUNC INT DIA_MiltenNW_KAP3_Entry_Condition()
{
	if (Kapitel == 3)	
	&& (hero.guild != GIL_KDF)
	&& (MiltenNW_GivesMonasteryKey == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_Entry_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_15_00"); //Musz� si� dosta� do klasztoru. To bardzo pilne!
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_MiltenNW_KAP3_Entry_03_01"); //W porz�dku. Masz tu klucz.
		
		CreateInvItems (self,ItKe_Innos_Mis,1);
		B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_02"); //Nie mog� ci� wpu�ci� do klasztoru! Narazi�bym si� Najwy�szej Radzie.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_03"); //Bez upowa�nienia moich zwierzchnik�w nie mog� ci� wpu�ci� do klasztoru.
	
		Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,DIALOG_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"To bardzo wa�ne!",DIA_MiltenNW_KAP3_Entry_Important);
	
		if (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS) >=1)
		{	
			Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"Mam tu list od Lorda Hagena.",DIA_MiltenNW_KAP3_Entry_Permit); 
		};
	};	
};	
	
FUNC VOID DIA_MiltenNW_KAP3_Entry_BACK ()
{
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};	

FUNC VOID DIA_MiltenNW_KAP3_Entry_Important ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Important_15_00"); //To bardzo wa�ne!
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01"); //Przykro mi. Pyrokar urwa�by mi g�ow�.
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

FUNC VOID DIA_MiltenNW_KAP3_Entry_Permit ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Permit_15_00"); //Mam tu list od Lorda Hagena.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01"); //Poka�.
	
	B_GiveInvItems (other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll ();	
	
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02"); //No dobrze. Masz tu klucz do klasztoru. Pyrokara znajdziesz w �wi�tyni.
	
	CreateInvItems (self,ItKe_Innos_Mis,1);
	B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	B_GiveInvItems (self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	
	MiltenNW_GivesMonasteryKey = TRUE;
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

//***************************************************************
//	Hast du hier jemanden herauskommen gesehen?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_NovizenChase(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information	= DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent	= FALSE;
	description = "Wiesz mo�e, dok�d uciek� Pedro?";
};                       
FUNC INT DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	IF 	(Kapitel == 3) 
	&&	(MIS_NOVIZENCHASE == LOG_RUNNING) 
	&& 	(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_NovizenChase_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_NovizenChase_15_00"); //Wiesz mo�e, dok�d uciek� Pedro?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01"); //A my�lisz, �e sta�bym tutaj, gdybym wiedzia�, gdzie ukry�a si� ta szuja?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02"); //Zobaczysz, zap�aci za to �wi�tokradztwo! Mam tylko nadziej�, �e zdo�amy odzyska� Oko!
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03"); //Musisz nam pom�c. Znajd� go i odzyskaj �wi�te Oko Innosa!
	//Joly: AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04"); //Ich werde sehen, was ich tun kann.
};	

//***************************************************************
//	Wei�t du etwas �ber die vermummten Gestalten?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_Perm(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 39;
	condition	= DIA_MiltenNW_KAP3_Perm_Condition;
	information	= DIA_MiltenNW_KAP3_Perm_Info;
	permanent	= FALSE;
	description = "Mo�esz mi co� powiedzie� o tych zakapturzonych postaciach?";
};                       
FUNC INT DIA_MiltenNW_KAP3_Perm_Condition()
{
	IF 	(Kapitel == 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Perm_15_00"); //Mo�esz mi co� powiedzie� o tych zakapturzonych postaciach?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_01"); //Niestety, nie. Ale mam co do nich bardzo z�e przeczucia.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_02"); //Lepiej nie wchod� im w drog�.
};	
	

//########################
//##					##
//##	Kapitel 4		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP4_EXIT_Condition;
	information	= DIA_MiltenNW_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Perm KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_PERM(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 49;
	condition	= DIA_MiltenNW_KAP4_PERM_Condition;
	information	= DIA_MiltenNW_KAP4_PERM_Info;
	permanent	= TRUE;
	description = "Jakie� wie�ci?";
};                       
FUNC INT DIA_MiltenNW_KAP4_PERM_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_00"); //Co� nowego?
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_01"); //To ja powinienem o to zapyta�. Wszyscy tutaj nadal si� niepokoj�.
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_02"); //Najwy�sza Rada pr�buje przewidzie� kolejny ruch nieprzyjaciela.
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_03"); //Co� jeszcze?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_04"); //Ostatnio du�o s�yszy si� o atakach ork�w, nawet poza G�rnicz� Dolin�.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_05"); //Nie podoba mi si� to wszystko. Boj� si�, �e zosta�o nam ju� bardzo niewiele czasu.
	}
	else if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_06"); //Pewien wie�niak widzia� ko�o swojej zagrody jakie� �uskowate istoty.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_07"); //Nie wiem ju�, co o tym wszystkim s�dzi�. Wr�g przygotowuje si� do kolejnego uderzenia, to pewne.
	}
	else if (MIS_FindTheObesessed == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_08"); //Docieraj� do nas wie�ci o kolejnych op�tanych ludziach. Nieprzyjaciel ro�nie w si�� o wiele szybciej, ni� si� tego spodziewa�em.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_09"); //Sytuacja nadal jest bardzo powa�na. Ca�a nadzieja w Innosie.
	};
};

//########################
//##					##
//##	Kapitel 5		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_MiltenNW_KAP5_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP5_EXIT_Condition;
	information	= DIA_MiltenNW_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Ich habe alle Drachen get�tet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_MiltenNW_AllDragonsDead(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_MiltenNW_AllDragonsDead_Condition;
	information	= DIA_MiltenNW_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Zabi�em wszystkie smoki.";
};                       
FUNC INT DIA_MiltenNW_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_00"); //Zabi�em wszystkie smoki.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_01"); //Naprawd�?! A wi�c znowu zap�on�a dla nas iskierka nadziei. Teraz musimy tylko uderzy� w samo serce Z�a.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_02"); //Je�li uda�o ci si� tego dokona�, zwyci�stwo b�dzie nasze.
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_03"); //Kto? Ja?!
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_04"); //Naturalnie! A kto inny?
	
	if (MiltenNW_IsOnBoard	 == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_05"); //Nie mamy czasu do stracenia. Ka�da chwila jest na wag� z�ota.
	};
};

///////////////////////////////////////////////////////////////////////
//	In Bibliothek gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_SCWasInLib		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_SCWasInLib_Condition;
	information	 = 	DIA_MiltenNW_SCWasInLib_Info;
	important	 = 	TRUE;

};
func int DIA_MiltenNW_SCWasInLib_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_SCWasInLib_Info ()
{
	AI_Output			(self, other, "DIA_MiltenNW_SCWasInLib_03_00"); //Podobno sp�dzi�e� sporo czasu w klasztornych podziemiach. Dowiedzia�e� si� czego� nowego?
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_MiltenNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Wiem ju�, gdzie kryje si� nieprzyjaciel!";
};

func int DIA_MiltenNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MiltenNW_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
var int SCToldMiltenHeKnowWhereEnemy;
func void DIA_MiltenNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_KnowWhereEnemy_15_00"); //Wiem ju�, gdzie kryje si� nieprzyjaciel! Jest ca�kiem niedaleko st�d.
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_01"); //Zatem musimy czym pr�dzej wyruszy� w drog�. To mo�e by� nasza jedyna szansa!
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);  
  	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
  	if ((Npc_IsDead(DiegoNW))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_02"); //A co Diego s�dzi na ten temat? My�l�, �e ch�tnie b�dzie ci towarzyszy�.
 		B_LogEntry (TOPIC_Crew,"Diego m�g�by by� bardzo pomocny. Nigdy nie potrafi� wytrzyma� d�ugo w jednym miejscu.");
 	};

  	if ((Npc_IsDead(GornNW_nach_DJG))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_03"); //Co z Gornem? Podobno wr�ci� z G�rniczej Doliny. Koniecznie z nim porozmawiaj.
 		B_LogEntry (TOPIC_Crew,"Gorn m�g�by by� bardzo pomocny. Zawsze dobrze jest mie� u swego boku doskona�ego wojownika. Mo�e zgodzi si� mnie szkoli�.");
 	};
	
	if ((Npc_IsDead(Lester))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_04"); //I nie zapomnij o Lesterze! Gdyby� nie wyci�gn�� go z tej doliny, by�oby po nim.
 		B_LogEntry (TOPIC_Crew,"Je�li nie wezm� ze sob� Lestera, prawdopodobnie nigdy nie wydostanie si� z doliny.");
 	};
	
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_05"); //Ja te� mam pewn� rol� do odegrania w tej sprawie. Mog� ci pom�c w zwi�kszeniu twojej many oraz przy sporz�dzaniu nowych run. Kiedy ruszamy?
	
	B_LogEntry (TOPIC_Crew,"Je�li zabior� ze sob� Miltena, nauczy mnie, jak tworzy� runy i zwi�ksza� moc magiczn�.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_MiltenNW_KnowWhereEnemy_15_06"); //Powoli, przyjacielu. Chwilowo mam ju� pe�n� za�og�.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_07"); //Zawsze mo�esz na mnie liczy�. Gdyby� zmieni� zdanie, wiesz, gdzie mnie szuka�.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_08"); //Powodzenia! Niech Innos ma was w swojej opiece!
	}
	else 
	{
		Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Chwilowo mi si� nie przydasz.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Witamy na pok�adzie!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00"); //Witamy na pok�adzie!
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01"); //Spotykamy si� na przystani. Nie sp�nij si�!
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02"); //W porz�dku. Mo�esz na mnie liczy�.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_No_15_00"); //Chwilowo mi si� nie przydasz.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01"); //Wiesz, �e zawsze mo�esz na mnie liczy�. Gdyby� zmieni� zdanie, b�d� tutaj czeka�.

	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	WhereCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_WhereCaptain		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_WhereCaptain_Condition;
	information	 = 	DIA_MiltenNW_WhereCaptain_Info;
	
	description	 = 	"Gdzie mog� znale�� kapitana statku?";

};
func int DIA_MiltenNW_WhereCaptain_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (SCToldMiltenHeKnowWhereEnemy == TRUE)
	&& (SCGotCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_WhereCaptain_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_WhereCaptain_15_00"); //Gdzie mog� znale�� kapitana statku?
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_01"); //Porozmawiaj z Jorgenem, w ko�cu by� kiedy� �eglarzem. Powiniene� spotka� go w klasztorze.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_02"); //Gdyby on nie m�g� ci pom�c, musisz popyta� w mie�cie, albo nawet na farmach. Z pewno�ci� s� tu jeszcze jacy� �eglarze.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_03"); //Na twoim miejscu porozmawia�bym o tym z Lee albo zajrza�bym na przysta� w Khorinis. To chyba najlepsze wyj�cie.
 
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                          
	B_LogEntry (TOPIC_Captain,"Jorgen m�g�by zosta� kapitanem mojego statku. Powinienem znale�� go w klasztorze. Poza tym na farmach i w mie�cie musi by� pe�no potencjalnych kandydat�w na to stanowisko. Mo�e powinienem zapyta� Lee albo rozejrze� si� w porcie.");
	
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_LeaveMyShip_Condition;
	information	 = 	DIA_MiltenNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Obawiam si�, �e jednak nie mo�esz ze mn� pop�yn��.";
};
func int DIA_MiltenNW_LeaveMyShip_Condition ()
{	
	if (MiltenNW_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_LeaveMyShip_15_00"); //Obawiam si�, �e jednak nie mo�esz ze mn� pop�yn��.
	AI_Output			(self, other, "DIA_MiltenNW_LeaveMyShip_03_01"); //Trudno. Wiesz najlepiej, kto ci si� przyda, a kto nie. Gdyby� zmieni� zdanie, znajdziesz mnie w klasztorze.
	
	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_StillNeedYou_Condition;
	information	 = 	DIA_MiltenNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Potrzebuj� twojej pomocy.";
};
func int DIA_MiltenNW_StillNeedYou_Condition ()
{	
	if ((MiltenNW_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man nat�rlich nur eine variable abfragen
	|| (MiltenNW_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_StillNeedYou_15_00"); //Potrzebuj� twojej pomocy.

	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_01"); //Czuj� si� zaszczycony. Chod�my wi�c! Nie mamy czasu do stracenia.
	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_02"); //Spotkamy si� wi�c na przystani.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	
		AI_StopProcessInfos (self);
};



// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenNW_Teach(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 90;
	condition	= DIA_MiltenNW_Teach_Condition;
	information	= DIA_MiltenNW_Teach_Info;
	permanent	= TRUE;
	description = "Chc� si� nauczy� nowych zakl��.";
};                       

FUNC INT DIA_MiltenNW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Teach_15_00");//Chc� si� nauczy� nowych zakl��.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenNW_Teach);
		Info_AddChoice (DIA_MiltenNW_Teach,DIALOG_BACK,DIA_MiltenNW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenNW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenNW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_Teach_03_01");//Nie pozna�e� jeszcze drugiego kr�gu magii! Nie mog� ci� niczego nauczy�.
	};
};	
FUNC VOID DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenNW_Teach);
};
FUNC VOID DIA_MiltenNW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_NW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenNW_Mana_Condition;
	information	 = 	DIA_MiltenNW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chc� zwi�kszy� moj� magiczn� moc.";
};
func int DIA_MiltenNW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)	
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenNW_Mana_15_00"); //Chc� zwi�kszy� moj� magiczn� moc.
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};
func void DIA_MiltenNW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenNW_Mana_03_00"); //Twoja magiczna moc i tak jest ogromna. Obawiam si�, �e nie mog� ci pom�c.
	};
	Info_ClearChoices (DIA_MiltenNW_Mana);
};
func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
	
};
func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mage_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_Mage_NW_PICKPOCKET_Condition;
	information	= DIA_Mage_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Mage_NW_PICKPOCKET_Condition()
{
	C_Beklauen (56, 75);
};
 
FUNC VOID DIA_Mage_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};
	
func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};


