// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_3_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_3_Fegen_Condition;
	information	= DIA_NOV_3_Fegen_Info;
	permanent	= TRUE;
	description = "Potrzebuj� pomocy w sprz�taniu sal nowicjuszy.";
};                       
//------------------------------------
var int Feger1_Permanent; 
var int Feger2_Permanent;
//------------------------------------
FUNC INT DIA_NOV_3_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Potrzebuj� pomocy przy sprz�taniu sal nowicjuszy.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Czy�by nikt nie zgodzi� ci si� pom�c? Dobrze... B�d� ci towarzyszy� przy tym zaj�ciu, je�li znajdziesz jeszcze przynajmniej jedn� osob�, kt�ra zgodzi si� na to samo.
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprz�taj�cy piwnic� pomo�e mi, je�li zdo�am znale�� innego ch�tnego do pomocy w sprz�taniu komnat.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //Czy b�d� jedyn� osob� pomagaj�c� ci w pracy?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Nie, ju� kto� mi pomaga.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //A wi�c i ja do was do��cz�.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz z piwnicy pomo�e mi teraz posprz�ta� komnaty.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Bracie! Ju� przecie� ci pomagam, nie musisz mnie dalej nak�ania�.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Oczywi�cie, �e ci pomog�. My nowicjusze powinni�my trzyma� si� razem. R�ka r�k� myje, je�li wiesz co mam na my�li.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Potrzebuj� jednak 50 sztuk z�ota, w ko�cu musz� sp�aci� Parlana.
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprzed �wi�tyni pomo�e mi, je�li dam mu 50 sztuk z�ota.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Mo�e p�niej...",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"W porz�dku, ju� p�ac�.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Przecie� obieca�em. Ty pomog�e� mnie, ja pomog� tobie.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Wykluczone - nie mam na to czasu. Poszukaj sobie kogo� innego do pomocy.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Mo�e innym razem, teraz nie sta� mnie na taki wydatek.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //W porz�dku, ju� p�ac�.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Bior� si� wi�c do pracy.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprzed �wi�tyni pomo�e mi teraz posprz�ta� komnaty.");
	
	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_3_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_3_Wurst_Condition;
	information	= DIA_NOV_3_Wurst_Info;
	permanent	= TRUE;
	description = "Chcesz spr�bowa� kie�basy?";
};                       

FUNC INT DIA_NOV_3_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Mo�e chcesz kie�bas�?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Jasne, czemu nie. Wygl�da smakowicie.
	
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
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "Chcia�bym zosta� magiem.";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Chcia�bym zosta� magiem.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //Wi�kszo�� nowicjuszy tego pragnie, jednak niewielu z nich udaje si� zyska� tytu� Wybra�ca, i szans� przyj�cia do Kr�gu Ognia.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Najwy�szym zaszczytem, jakiego mo�esz dost�pi� w naszym zakonie, jest tytu� maga Kr�gu Ognia.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //B�dziesz musia� ci�ko pracowa�, by zas�u�y� na swoj� szans�.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto jest przyw�dc� klasztoru?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Kto jest przyw�dc� klasztoru?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //My, nowicjusze, s�u�ymy magom Kr�gu Ognia. Oni za� podlegaj� decyzjom Najwy�szej Rady, w sk�ad kt�rej wchodz� trzej najpot�niejsi magowie.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Sprawami nowicjuszy zajmuje si� jednak Parlan. Prawie zawsze przesiaduje na dziedzi�cu, nadzoruj�c ich prac�.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mo�esz mi powiedzie� o tym klasztorze?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Co mo�esz mi powiedzie� o tym klasztorze?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //�yjemy tu bardzo skromnie. Hodujemy owce i wytwarzamy wino.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Mamy te� bibliotek�, ale dost�p do niej posiadaj� jedynie magowie i wybrani nowicjusze.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //My, nowicjusze, dbamy o to, by niczego nie zabrak�o magom Kr�gu Ognia.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_3_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_3_STANDARD_Condition;
	information	= DIA_NOV_3_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NOV_3_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Co s�ycha�?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Dobre pytanie! Nowicjusze rozmawiaj� tylko o tobie.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Naprawd� rzadko si� zdarza, aby kto� obcy zosta� tak szybko przyj�ty do Kr�gu Ognia.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //Nadszed� czas. Wkr�tce kt�ry� z nowicjuszy zostanie przyj�ty do Kr�gu Ognia.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Wkr�tce rozpoczn� si� pr�by.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Beliar zdo�a� przenikn�� do naszego klasztoru! Jego pot�ga ro�nie, skoro nawet tutaj ma ju� swoich sojusznik�w...
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro s�u�y� w zakonie przez lata. Obawiam si� jednak, �e sp�dzi� poza tymi murami zbyt wiele czasu, to za� os�abi�o jego wiar� i uczyni�o podatnym na wp�ywy Beliara.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Przybywasz we w�a�ciwym czasie. Chyba sam Innos ci� tu przys�a�.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Tajemnice zakonu poznasz ju� jako obro�ca Oka.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Z G�rniczej Doliny docieraj� do nas niepokoj�ce wie�ci. Innos wystawia nas na ci�k� pr�b�.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Paladyni, kt�rzy wyruszyli w kierunku G�rniczej Doliny, nie daj� znaku �ycia. Jedynie Najwy�sza Rada wie, co nale�y robi�.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Zniszczymy smoki z pomoc� naszego Pana! Jedynie gniew Innosa jest w stanie przeciwstawi� si� bestiom Beliara.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Chwa�a Innosowi, �e nie dopu�ci� do nast�pnego konfliktu. Jedynie powr�t na �cie�k� naszego Pana da nam si�� do przeciwstawienia si� Z�u.

	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc					= Hlp_GetInstanceID(slf);
};
