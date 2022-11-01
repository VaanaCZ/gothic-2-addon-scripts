// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "Potřebuju pomoci zamést pokoje noviců.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Potřebuju pomoct zamést pokoje noviců.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //No nazdar. Právě jsi přišel a hned ze sebe necháš dělat uklízečku?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Uklidni se, se mnou to bylo to samé, když jsem sem poprvé přišel. A proto se ti chystám pomoct. Asi by se nám pěkně vysmáli, kdybychom to nezvládli.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Už jsem narazil na novice, který mi s úklidem komnat pomůže.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Bratře, jsem obeznámen se situací, do které ses dostal. A už jsem ti řekl, že ti pomohu. A to právě dělám.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Hele, rád bych, ale fakt nemám čas.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "Co takhle jemňoučká skopová klobáska?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Co takhle jemňoučká skopová klobáska?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Tak tomu se nedá říct ne. Díky, chlape, přesně to jsem potřeboval.
	
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
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "Co musím udělat, abych se stal mágem?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Co musím udělat, abych se stal mágem?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Innosovým vyvoleným se můžeš stát pouze v případě, že k tomu dá svolení nejvyšší rada.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Jako novicové máme zakázáno studovat runovou magii - a staré posvátné spisy můžeme pročítat jen se svolením mágů.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo vede tenhle klášter?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //Kdo vede tenhle klášter?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //Nejvyšší rada, kterou tvoří tři nejmocnější mágové. Každodenně se scházejí v kostele.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Innosovi vyvolení jsou všichni mágové. Innos jim poskytl tento dar, a tak mohou na zemi plnit jeho vůli.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Pověz mi o klášteru něco víc.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //Řekni mi o klášteru něco víc.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //Jeho původ sahá hluboko do minulosti. Pochází z dob vlády Rhobara I.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Pod klášterem se rozkládají katakomby. Vedou hluboko do hor.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die höchsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Je něco nového?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //Dalo by se říct, že ano. Už je to víc než sto let, co byl nějaký novic tak rychle přijat do kruhu ohně.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Doufám, že se mi této cti také jednou dostane. Budu na tom tvrdě pracovat.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Nedávno do Khorinidu přijeli paladinové. Jeden z nich je tady v klášteře, aby se tu modlil k Innosovi.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Pořád tomu nemohu uvěřit. Jeden z nás zradil klášter a ukradl Innosovo oko.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Naším úkolem bylo vybudovat soudržnou společnost, ale byli jsme příliš slabí. To je jediný důvod, proč se mohlo Beliarovi podařit přetáhnout jednoho z nás na svou stranu.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Innos buď pochválen. Podařilo se nám Oko dostat od nepřítele zpět.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Tvá odvaha by mohla být příkladem mnoha zoufalým duším, a pomoci jim tak přečkat tyto temné časy.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //Zaslechl jsem něco o dracích a armádě zla. Innos nás opatruj!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //Nejvyšší rada má na situaci našich paladinů zvláštní zájem. Už nějakou dobu jsme z Hornického údolí nedostali žádné zprávy.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //Ne. A jsem za to našemu Pánu vděčný. S Innosovým okem budeme moci ty draky porazit!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Ano. Dosáhli jsme vítězství nad draky! Innos nám ukázal, že nikdy nesmíme ztrácet naději.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //V současnosti se musíme potýkat se sílou temnoty a bude třeba zažehnout ještě mnoho ohňů, abychom ji sprovodili ze světa.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};
