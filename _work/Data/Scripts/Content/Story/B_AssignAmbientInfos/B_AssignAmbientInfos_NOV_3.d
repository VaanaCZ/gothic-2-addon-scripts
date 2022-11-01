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
	description = "Potrzebuję pomocy w sprzątaniu sal nowicjuszy.";
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
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Potrzebuję pomocy przy sprzątaniu sal nowicjuszy.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Czyżby nikt nie zgodził ci się pomóc? Dobrze... Będę ci towarzyszył przy tym zajęciu, jeśli znajdziesz jeszcze przynajmniej jedną osobę, która zgodzi się na to samo.
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprzątający piwnicę pomoże mi, jeśli zdołam znaleźć innego chętnego do pomocy w sprzątaniu komnat.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //Czy będę jedyną osobą pomagającą ci w pracy?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Nie, już ktoś mi pomaga.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //A więc i ja do was dołączę.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz z piwnicy pomoże mi teraz posprzątać komnaty.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Bracie! Już przecież ci pomagam, nie musisz mnie dalej nakłaniać.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Oczywiście, że ci pomogę. My nowicjusze powinniśmy trzymać się razem. Ręka rękę myje, jeśli wiesz co mam na myśli.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Potrzebuję jednak 50 sztuk złota, w końcu muszę spłacić Parlana.
			
			B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprzed świątyni pomoże mi, jeśli dam mu 50 sztuk złota.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Może później...",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"W porządku, już płacę.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Przecież obiecałem. Ty pomogłeś mnie, ja pomogę tobie.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Wykluczone - nie mam na to czasu. Poszukaj sobie kogoś innego do pomocy.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Może innym razem, teraz nie stać mnie na taki wydatek.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //W porządku, już płacę.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Biorę się więc do pracy.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Nowicjusz sprzed świątyni pomoże mi teraz posprzątać komnaty.");
	
	
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
	description = "Chcesz spróbować kiełbasy?";
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
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Może chcesz kiełbasę?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Jasne, czemu nie. Wygląda smakowicie.
	
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
	description = "Chciałbym zostać magiem.";
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
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Chciałbym zostać magiem.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //Większość nowicjuszy tego pragnie, jednak niewielu z nich udaje się zyskać tytuł Wybrańca, i szansę przyjęcia do Kręgu Ognia.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Najwyższym zaszczytem, jakiego możesz dostąpić w naszym zakonie, jest tytuł maga Kręgu Ognia.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Będziesz musiał ciężko pracować, by zasłużyć na swoją szansę.
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
	description = "Kto jest przywódcą klasztoru?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Kto jest przywódcą klasztoru?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //My, nowicjusze, służymy magom Kręgu Ognia. Oni zaś podlegają decyzjom Najwyższej Rady, w skład której wchodzą trzej najpotężniejsi magowie.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Sprawami nowicjuszy zajmuje się jednak Parlan. Prawie zawsze przesiaduje na dziedzińcu, nadzorując ich pracę.
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
	description = "Co możesz mi powiedzieć o tym klasztorze?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Co możesz mi powiedzieć o tym klasztorze?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Żyjemy tu bardzo skromnie. Hodujemy owce i wytwarzamy wino.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Mamy też bibliotekę, ale dostęp do niej posiadają jedynie magowie i wybrani nowicjusze.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //My, nowicjusze, dbamy o to, by niczego nie zabrakło magom Kręgu Ognia.
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
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Dobre pytanie! Nowicjusze rozmawiają tylko o tobie.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Naprawdę rzadko się zdarza, aby ktoś obcy został tak szybko przyjęty do Kręgu Ognia.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //Nadszedł czas. Wkrótce któryś z nowicjuszy zostanie przyjęty do Kręgu Ognia.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Wkrótce rozpoczną się próby.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Beliar zdołał przeniknąć do naszego klasztoru! Jego potęga rośnie, skoro nawet tutaj ma już swoich sojuszników...
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro służył w zakonie przez lata. Obawiam się jednak, że spędził poza tymi murami zbyt wiele czasu, to zaś osłabiło jego wiarę i uczyniło podatnym na wpływy Beliara.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Przybywasz we właściwym czasie. Chyba sam Innos cię tu przysłał.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Tajemnice zakonu poznasz już jako obrońca Oka.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Z Górniczej Doliny docierają do nas niepokojące wieści. Innos wystawia nas na ciężką próbę.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Paladyni, którzy wyruszyli w kierunku Górniczej Doliny, nie dają znaku życia. Jedynie Najwyższa Rada wie, co należy robić.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Zniszczymy smoki z pomocą naszego Pana! Jedynie gniew Innosa jest w stanie przeciwstawić się bestiom Beliara.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Chwała Innosowi, że nie dopuścił do następnego konfliktu. Jedynie powrót na ścieżkę naszego Pana da nam siłę do przeciwstawienia się Złu.

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
