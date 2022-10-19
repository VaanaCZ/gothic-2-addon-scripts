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
	description = "Potrzebujê pomocy w sprz¹taniu sal nowicjuszy.";
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
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Potrzebujê pomocy przy sprz¹taniu sal nowicjuszy.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Czy¿by nikt nie zgodzi³ ci siê pomóc? Dobrze... Bêdê ci towarzyszy³ przy tym zajêciu, jeœli znajdziesz jeszcze przynajmniej jedn¹ osobê, która zgodzi siê na to samo.
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprz¹taj¹cy piwnicê pomo¿e mi, jeœli zdo³am znaleŸæ innego chêtnego do pomocy w sprz¹taniu komnat.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //Czy bêdê jedyn¹ osob¹ pomagaj¹c¹ ci w pracy?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Nie, ju¿ ktoœ mi pomaga.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //A wiêc i ja do was do³¹czê.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz z piwnicy pomo¿e mi teraz posprz¹taæ komnaty.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Bracie! Ju¿ przecie¿ ci pomagam, nie musisz mnie dalej nak³aniaæ.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Oczywiœcie, ¿e ci pomogê. My nowicjusze powinniœmy trzymaæ siê razem. Rêka rêkê myje, jeœli wiesz co mam na myœli.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Potrzebujê jednak 50 sztuk z³ota, w koñcu muszê sp³aciæ Parlana.
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprzed œwi¹tyni pomo¿e mi, jeœli dam mu 50 sztuk z³ota.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Mo¿e póŸniej...",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"W porz¹dku, ju¿ p³acê.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Przecie¿ obieca³em. Ty pomog³eœ mnie, ja pomogê tobie.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Wykluczone - nie mam na to czasu. Poszukaj sobie kogoœ innego do pomocy.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Mo¿e innym razem, teraz nie staæ mnie na taki wydatek.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //W porz¹dku, ju¿ p³acê.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Biorê siê wiêc do pracy.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprzed œwi¹tyni pomo¿e mi teraz posprz¹taæ komnaty.");
	
	
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
	description = "Chcesz spróbowaæ kie³basy?";
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
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Mo¿e chcesz kie³basê?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Jasne, czemu nie. Wygl¹da smakowicie.
	
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
	description = "Chcia³bym zostaæ magiem.";
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
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Chcia³bym zostaæ magiem.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //Wiêkszoœæ nowicjuszy tego pragnie, jednak niewielu z nich udaje siê zyskaæ tytu³ Wybrañca, i szansê przyjêcia do Krêgu Ognia.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Najwy¿szym zaszczytem, jakiego mo¿esz dost¹piæ w naszym zakonie, jest tytu³ maga Krêgu Ognia.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Bêdziesz musia³ ciê¿ko pracowaæ, by zas³u¿yæ na swoj¹ szansê.
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
	description = "Kto jest przywódc¹ klasztoru?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Kto jest przywódc¹ klasztoru?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //My, nowicjusze, s³u¿ymy magom Krêgu Ognia. Oni zaœ podlegaj¹ decyzjom Najwy¿szej Rady, w sk³ad której wchodz¹ trzej najpotê¿niejsi magowie.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Sprawami nowicjuszy zajmuje siê jednak Parlan. Prawie zawsze przesiaduje na dziedziñcu, nadzoruj¹c ich pracê.
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
	description = "Co mo¿esz mi powiedzieæ o tym klasztorze?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Co mo¿esz mi powiedzieæ o tym klasztorze?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //¯yjemy tu bardzo skromnie. Hodujemy owce i wytwarzamy wino.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Mamy te¿ bibliotekê, ale dostêp do niej posiadaj¹ jedynie magowie i wybrani nowicjusze.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //My, nowicjusze, dbamy o to, by niczego nie zabrak³o magom Krêgu Ognia.
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
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Co s³ychaæ?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Dobre pytanie! Nowicjusze rozmawiaj¹ tylko o tobie.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Naprawdê rzadko siê zdarza, aby ktoœ obcy zosta³ tak szybko przyjêty do Krêgu Ognia.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //Nadszed³ czas. Wkrótce któryœ z nowicjuszy zostanie przyjêty do Krêgu Ognia.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Wkrótce rozpoczn¹ siê próby.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Beliar zdo³a³ przenikn¹æ do naszego klasztoru! Jego potêga roœnie, skoro nawet tutaj ma ju¿ swoich sojuszników...
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro s³u¿y³ w zakonie przez lata. Obawiam siê jednak, ¿e spêdzi³ poza tymi murami zbyt wiele czasu, to zaœ os³abi³o jego wiarê i uczyni³o podatnym na wp³ywy Beliara.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Przybywasz we w³aœciwym czasie. Chyba sam Innos ciê tu przys³a³.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Tajemnice zakonu poznasz ju¿ jako obroñca Oka.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Z Górniczej Doliny docieraj¹ do nas niepokoj¹ce wieœci. Innos wystawia nas na ciê¿k¹ próbê.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Paladyni, którzy wyruszyli w kierunku Górniczej Doliny, nie daj¹ znaku ¿ycia. Jedynie Najwy¿sza Rada wie, co nale¿y robiæ.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Zniszczymy smoki z pomoc¹ naszego Pana! Jedynie gniew Innosa jest w stanie przeciwstawiæ siê bestiom Beliara.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Chwa³a Innosowi, ¿e nie dopuœci³ do nastêpnego konfliktu. Jedynie powrót na œcie¿kê naszego Pana da nam si³ê do przeciwstawienia siê Z³u.

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
