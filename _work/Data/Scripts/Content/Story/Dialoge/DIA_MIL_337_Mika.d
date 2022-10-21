///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_EXIT_Condition()
{
	if Kapitel <=2
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Refuse Talk wenn Lares am Start
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Refuse   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 1;
	condition   = DIA_Mika_Refuse_Condition;
	information = DIA_Mika_Refuse_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Mika_Refuse_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lares.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mika_Refuse_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WOHIN		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr    	 = 4;     
	condition	 = 	DIA_Mika_WOHIN_Condition;
	information	 = 	DIA_Mika_WOHIN_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WOHIN_Condition ()
{
	if (Lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WOHIN_12_00"); //Hej, czekaj, nie tak szybko. Samotna w�dr�wka mo�e si� dla ciebie �le sko�czy�, to niebezpieczne okolice. Sk�d idziesz?

	Info_ClearChoices	(DIA_Mika_WOHIN);

	Info_AddChoice	(DIA_Mika_WOHIN, "Nie tw�j interes.", DIA_Mika_WOHIN_weg );
	Info_AddChoice	(DIA_Mika_WOHIN, "Z jednej z farm.", DIA_Mika_WOHIN_Bauern );
	Info_AddChoice	(DIA_Mika_WOHIN, "Z miasta!", DIA_Mika_WOHIN_stadt );
};
func void DIA_Mika_WOHIN_stadt ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_stadt_15_00"); //Z miasta!
	AI_Output			(self, other, "DIA_Mika_WOHIN_stadt_12_01"); //Prosz�, prosz�. I zapu�ci�e� si� a� tutaj, tak daleko od domu?

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_Bauern_15_00"); //Z jednej z farm.
	AI_Output			(self, other, "DIA_Mika_WOHIN_Bauern_12_01"); //Farmer? Hmmm... Wi�c nie powiniene� samotnie w�drowa� przez tak niebezpieczn� okolic�. Kto wie, co mo�e ci si� przydarzy�.

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_weg_15_00"); //To nie twoja sprawa.
	AI_Output			(self, other, "DIA_Mika_WOHIN_weg_12_01"); //Skoro tak twierdzisz. Tylko �eby� si� nie zdziwi�, je�li przydarzy ci si� co� bardzo niemi�ego. �ycz� udanego spaceru.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGefaehrlich
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASGEFAEHRLICH		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	5;
	condition	 = 	DIA_Mika_WASGEFAEHRLICH_Condition;
	information	 = 	DIA_Mika_WASGEFAEHRLICH_Info;

	description	 = 	"Co to za straszliwe niebezpiecze�stwa?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition ()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASGEFAEHRLICH_15_00"); //Co to za straszliwe niebezpiecze�stwa?
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_01"); //Wiele rzeczy.
	if (other.protection[PROT_EDGE]	< ITAR_Leather_L.protection [PROT_EDGE])	//Joly: kleiner als die Lederr�stung
	{
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_02"); //Na przyk�ad bandyci. Takiego s�abeusza jak ty zjedz� �ywcem na �niadanie.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_03"); //Je�li nie wpadniesz w r�ce bandyt�w, zajm� si� tob� dzikie bestie i najemnicy grasuj�cy w tych lasach.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_04"); //Znajd� sobie najpierw chocia� jak�� przyzwoit� zbroj�.
	};
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_05"); //Za�o�� si�, �e b�dziesz krzycze� o pomoc, jeszcze zanim dotrzesz do nast�pnego zakr�tu.
	
};

///////////////////////////////////////////////////////////////////////
//	Info waskostetHilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASKOSTETHILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	6;
	condition	 = 	DIA_Mika_WASKOSTETHILFE_Condition;
	information	 = 	DIA_Mika_WASKOSTETHILFE_Info;

	description	 = 	"Przypu��my, �e b�d� potrzebowa� twojej pomocy.";
};

func int DIA_Mika_WASKOSTETHILFE_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Mika_WASGEFAEHRLICH))
				{
						return TRUE;
				};
};

func void DIA_Mika_WASKOSTETHILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_15_00"); //Przypu��my, �e b�d� potrzebowa� twojej pomocy. Ile b�dzie mnie ona kosztowa�a?
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_01"); //Jestem skromnym s�ug� naszego Kr�la i nie sprawia mi rado�ci wyzyskiwanie bezbronnych obywateli.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_02"); //Jednak skoro stawiasz spraw� w ten spos�b, niewielkie wsparcie finansowe mog�oby dobrze zrobi� naszym przysz�ym kontaktom handlowym.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_03"); //Na pocz�tek 10 z�otych monet. Co o tym my�lisz?

	Info_ClearChoices	(DIA_Mika_WASKOSTETHILFE);

	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Musz� si� zastanowi�.", DIA_Mika_WASKOSTETHILFE_nochnicht );
	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Czemu nie? Oto twoje 10 sztuk z�ota.", DIA_Mika_WASKOSTETHILFE_ja );

};

func void DIA_Mika_WASKOSTETHILFE_ja ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_ja_15_00"); //Czemu nie? Oto twoje 10 sztuk z�ota.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_01"); //Wspaniale. Je�li b�dziesz potrzebowa� mojej pomocy, wiesz, gdzie mnie znale��.
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_02"); //Mam tylko jedn� pro�b�: nie przybiegaj do mnie z ka�dym nieistotnym drobiazgiem, rozumiesz?
				
				Mika_Helps = TRUE;
			}
		else
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_03"); //Nie masz pieni�dzy. Mo�e wi�c powiniene� si� zastanowi�, czy faktycznie potrzebujesz mojej pomocy.
			};
	AI_StopProcessInfos (self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_nochnicht_15_00"); //Pomy�l� o tym.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_nochnicht_12_01"); //Bardzo prosz�. Mi�ej �mierci.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ueberlegt
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_UEBERLEGT		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	7;
	condition	 = 	DIA_Mika_UEBERLEGT_Condition;
	information	 = 	DIA_Mika_UEBERLEGT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zmieni�em zdanie. Oto 10 z�otych monet.";
};

func int DIA_Mika_UEBERLEGT_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Mika_WASKOSTETHILFE))
	&&	(Mika_Helps == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Mika_UEBERLEGT_Info ()
{
	AI_Output			(other, self, "DIA_Mika_UEBERLEGT_15_00"); //Zmieni�em zdanie. Oto 10 z�otych monet.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_01"); //Doskonale. Lepiej p�no ni� wcale. A teraz?
			
			Mika_Helps = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_02"); //Wr��, kiedy ju� b�dziesz mia� pieni�dze.
			AI_StopProcessInfos (self);	
		};
};

///////////////////////////////////////////////////////////////////////
//	Info HILFE
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_HILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_HILFE_Condition;
	information	 = 	DIA_Mika_HILFE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Potrzebuj� pomocy.";
};

func int DIA_Mika_HILFE_Condition ()
{
	if (Mika_Helps == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Mika_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_15_00"); //Potrzebuj� pomocy.
	AI_Output			(self, other, "DIA_Mika_HILFE_12_01"); //Skoro tak twierdzisz... Co si� sta�o?

	Info_ClearChoices	(DIA_Mika_HILFE);
	
	Info_AddChoice	(DIA_Mika_HILFE, "Goni� mnie bandyci.", DIA_Mika_HILFE_schongut );
	Info_AddChoice	(DIA_Mika_HILFE, "Atakuj� mnie potwory.", DIA_Mika_HILFE_monster );

	if (!Npc_IsDead (Alvares)) 
	&& (!Npc_IsDead (Engardo))
	&& ( (Akils_SLDstillthere == TRUE) || (Npc_KnowsInfo (other, DIA_Sarah_Bauern)) )
	{
		Info_AddChoice	(DIA_Mika_HILFE, "Farmer Akil zosta� zaatakowany przez najemnik�w.", DIA_Mika_HILFE_Akil );
	};
};

func void DIA_Mika_HILFE_Akil ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_Akil_15_00"); //Farmer Akil zosta� zaatakowany przez najemnik�w.
	AI_Output			(self, other, "DIA_Mika_HILFE_Akil_12_01"); //Co? Ta ho�ota panoszy si� na farmie Akila? A zatem nie tra�my wi�cej czasu. Za mn�.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP (Xp_Ambient);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Mika chce mi pom�c w rozwi�zaniu problemu Akila z najemnikami."); 

	Npc_ExchangeRoutine	(self,"Akil"); 
};

func void DIA_Mika_HILFE_monster ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_monster_15_00"); //Atakuj� mnie potwory.
	AI_Output			(self, other, "DIA_Mika_HILFE_monster_12_01"); //Ale w tej chwili nie widz� tu �adnych potwor�w. Na pewno wszystko zmy�li�e�.

	AI_StopProcessInfos (self);	
};

func void DIA_Mika_HILFE_schongut ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_schongut_15_00"); //Goni� mnie bandyci.
	AI_Output			(self, other, "DIA_Mika_HILFE_schongut_12_01"); //Doprawdy? A gdzie si� podziali? Gdyby naprawd� ci� gonili, chyba by�oby ich wida�, nie?

	AI_StopProcessInfos (self);	
};



///////////////////////////////////////////////////////////////////////
//	Info Zack
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Zack		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_Zack_Condition;
	information	 = 	DIA_Mika_Zack_Info;
	important	 = 	TRUE;

};

func int DIA_Mika_Zack_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<500)
	&& ((!Npc_IsDead (Alvares))||(!Npc_IsDead (Engardo)))	
		{
			return TRUE;
		};
};

func void DIA_Mika_Zack_Info ()
{
	AI_Output			(self, other, "DIA_Mika_Zack_12_00"); //A teraz zobacz, jak to dzia�a.
	Info_AddChoice	(DIA_Mika_Zack, DIALOG_ENDE, DIA_Mika_Zack_los );
};
func void DIA_Mika_Zack_los ()
{
	AI_StopProcessInfos (self);
	//Joly: B_attack funzt hier nicht und ist auch nicht n�tig!!!!!!!!!!!
	if(!Npc_IsDead (Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};	
	if (!Npc_IsDead (Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WiederNachHause
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WIEDERNACHHAUSE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr 		 = 9;
	condition	 = 	DIA_Mika_WIEDERNACHHAUSE_Condition;
	information	 = 	DIA_Mika_WIEDERNACHHAUSE_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<10000)
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WIEDERNACHHAUSE_12_00"); //Dobrze, wystarczy. B�d� si� zmywa�.

	AI_StopProcessInfos (self);		
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start"); 
	B_GivePlayerXP (Xp_Ambient);
};

//############################################
//##
//##	Kapitel 3
//##
//############################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_Kap3_EXIT_Condition()
{
	if Kapitel >= 3
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//***************************************************
//		Perm Kap3
//***************************************************

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3u4u5_PERM   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 39;
	condition   = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_Mika_Kap3u4u5_PERM_Info;
	permanent   = TRUE;
	description = "Wszystko w porz�dku?";
};

FUNC INT DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if  (Kapitel >= 3)
	&& 	(Npc_KnowsInfo(other, DIA_Mika_WOHIN))
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Mika_Kap3u4u5_PERM_15_00"); //Wszystko w porz�dku?
	AI_Output (self ,other,"DIA_Mika_Kap3u4u5_PERM_12_01"); //Wci�� jeste� �ywy. Zadziwiaj�ce.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mika_PICKPOCKET (C_INFO)
{
	npc			= Mil_337_Mika;
	nr			= 900;
	condition	= DIA_Mika_PICKPOCKET_Condition;
	information	= DIA_Mika_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Mika_PICKPOCKET_Condition()
{
	C_Beklauen (65, 75);
};
 
FUNC VOID DIA_Mika_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mika_PICKPOCKET);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_BACK 		,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};
	
func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};


