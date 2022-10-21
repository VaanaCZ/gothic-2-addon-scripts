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
	description = "Chcê siê do was przy³¹czyæ!";
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
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Chcê siê do was przy³¹czyæ.
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //S³ysza³em, ¿e da³eœ siê stra¿y we znaki. Przyda³byœ siê nam.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Œci¹ganie czynszu od farmerów nie jest raczej trudnym zadaniem, ale skoro Onar chce ci za to p³aciæ, to ja nie bêdê siê wtr¹ca³.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Ty? Niech no tylko Torlof podda ciê próbie, a stracisz ten zapa³, miêczaku.
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
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Naszym szefem jest Lee, a Torlof jego praw¹ rêk¹. Wiêkszoœæ ludzi liczy siê z jego zdaniem, poniewa¿ dowodzi³ nimi jeszcze za czasów kolonii.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //Jest jeszcze Sylvio. Zjawi³ siê tu, wraz z grupk¹ swoich ludzi, po przybyciu Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //On i jego banda stanowi¹ niewielk¹ czêœæ wszystkich najemników - ale sprawiaj¹ du¿o k³opotów. Ci kolesie prowadz¹ w³asn¹ grê.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //Sylvio to brudny sukinsyn. Uwa¿aj, kiedy go spotkasz.
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
	description = "Powiedz mi coœ o farmie.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Powiedz mi coœ o farmie.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Na rozkaz Onara pilnujemy jego w³asnoœci.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Nie myœl nawet o tym, ¿eby coœ zwêdziæ, niech ci te¿ nie przyjdzie do g³owy wdawaæ siê w bójki z ch³opami. No chyba ¿e chcesz mieæ z nami do czynienia, jasne?
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
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Co s³ychaæ?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Od kiedy siê do nas przy³¹czy³eœ, na farmie zapanowa³ spokój - ¿adnej stra¿y.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //U nas, nic ciekawego. Ale popytaj w mieœcie. Zdaje siê, ¿e maj¹ problemy z dostawami ¿ywnoœci.
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //W Górniczej Dolinie rozbestwi³y siê smoki! Nie chcia³bym znaleŸæ siê teraz na miejscu paladynów.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Domyœlam siê, ¿e Król porz¹dnie skopie ty³ek Lordowi Hagenowi, gdy ten, z powodu smoków, wróci z pustymi rêkami.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Czy wy, paladyni, nie moglibyœcie zaj¹æ siê smokami? Zreszt¹, walka to coœ dla prawdziwych facetów.
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
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //Sposób, w jaki rozwi¹za³eœ sprawê Benneta, godny jest pochwa³y. Sylvio pewnie zzielenia³ z wœciek³oœci. Wola³by chyba najechaæ na miasto i roznieœæ je w py³.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Zawsze próbuje poni¿yæ i oœmieszyæ Lee, a Bennet dostarczy³ mu dobrego pretekstu.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Nie wiem, dlaczego pomog³eœ Bennetowi, ale uwierz mi, miasto na tym skorzysta.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Ta sprawa z Bennetem to nic dobrego. Mo¿e, mimo wszystko, powinniœmy pos³uchaæ Sylvia i zaatakowaæ miasto.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Jakie masz plany w stosunku do Benneta? No có¿, w³aœciwie to wolê nie wiedzieæ, sam siê wkrótce przekonasz, do czego to wszystko prowadzi.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Myœla³em, ¿e tak jak Sylvio, te¿ zmierzasz w kierunku doliny.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Nikt z nas by nie ¿a³owa³, gdyby Sylvio zosta³ w dolinie. NA ZAWSZE.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //Masz du¿o odwagi, ¿eby tu siê pokazywaæ.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Ale nic mnie to nie obchodzi, póki nie chcesz œci¹gaæ podatków.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Do diab³a, d³u¿ej tego nie zniosê. Owce, pastwiska, drzewa. Drzewa, owce i pastwiska. Chcê siê st¹d w koñcu wydostaæ.
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
