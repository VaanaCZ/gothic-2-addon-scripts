// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "Chcę się do was przyłączyć!";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Chcę się do was przyłączyć.
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //Słyszałem, że dałeś się straży we znaki. Przydałbyś się nam.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Ściąganie czynszu od farmerów nie jest raczej trudnym zadaniem, ale skoro Onar chce ci za to płacić, to ja nie będę się wtrącał.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Ty? Niech no tylko Torlof podda cię próbie, a stracisz ten zapał, mięczaku.
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Naszym szefem jest Lee, a Torlof jego prawą ręką. Większość ludzi liczy się z jego zdaniem, ponieważ dowodził nimi jeszcze za czasów kolonii.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //Jest jeszcze Sylvio. Zjawił się tu, wraz z grupką swoich ludzi, po przybyciu Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //On i jego banda stanowią niewielką część wszystkich najemników - ale sprawiają dużo kłopotów. Ci kolesie prowadzą własną grę.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //Sylvio to brudny sukinsyn. Uważaj, kiedy go spotkasz.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Powiedz mi coś o farmie.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Powiedz mi coś o farmie.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Na rozkaz Onara pilnujemy jego własności.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Nie myśl nawet o tym, żeby coś zwędzić, niech ci też nie przyjdzie do głowy wdawać się w bójki z chłopami. No chyba że chcesz mieć z nami do czynienia, jasne?
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_7_STANDARD_Condition;
	information	= DIA_SLD_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Od kiedy się do nas przyłączyłeś, na farmie zapanował spokój - żadnej straży.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //U nas, nic ciekawego. Ale popytaj w mieście. Zdaje się, że mają problemy z dostawami żywności.
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //W Górniczej Dolinie rozbestwiły się smoki! Nie chciałbym znaleźć się teraz na miejscu paladynów.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Domyślam się, że Król porządnie skopie tyłek Lordowi Hagenowi, gdy ten, z powodu smoków, wróci z pustymi rękami.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Czy wy, paladyni, nie moglibyście zająć się smokami? Zresztą, walka to coś dla prawdziwych facetów.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //Sposób, w jaki rozwiązałeś sprawę Benneta, godny jest pochwały. Sylvio pewnie zzieleniał z wściekłości. Wolałby chyba najechać na miasto i roznieść je w pył.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Zawsze próbuje poniżyć i ośmieszyć Lee, a Bennet dostarczył mu dobrego pretekstu.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Nie wiem, dlaczego pomogłeś Bennetowi, ale uwierz mi, miasto na tym skorzysta.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Ta sprawa z Bennetem to nic dobrego. Może, mimo wszystko, powinniśmy posłuchać Sylvia i zaatakować miasto.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Jakie masz plany w stosunku do Benneta? No cóż, właściwie to wolę nie wiedzieć, sam się wkrótce przekonasz, do czego to wszystko prowadzi.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Myślałem, że tak jak Sylvio, też zmierzasz w kierunku doliny.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Nikt z nas by nie żałował, gdyby Sylvio został w dolinie. NA ZAWSZE.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //Masz dużo odwagi, żeby tu się pokazywać.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Ale nic mnie to nie obchodzi, póki nie chcesz ściągać podatków.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Do diabła, dłużej tego nie zniosę. Owce, pastwiska, drzewa. Drzewa, owce i pastwiska. Chcę się stąd w końcu wydostać.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
