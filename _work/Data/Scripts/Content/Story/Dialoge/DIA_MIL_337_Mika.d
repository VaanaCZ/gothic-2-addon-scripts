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
	AI_Output			(self, other, "DIA_Mika_WOHIN_12_00"); //Hej, czekaj, nie tak szybko. Samotna wêdrówka mo¿e siê dla ciebie Ÿle skoñczyæ, to niebezpieczne okolice. Sk¹d idziesz?

	Info_ClearChoices	(DIA_Mika_WOHIN);

	Info_AddChoice	(DIA_Mika_WOHIN, "Nie twój interes.", DIA_Mika_WOHIN_weg );
	Info_AddChoice	(DIA_Mika_WOHIN, "Z jednej z farm.", DIA_Mika_WOHIN_Bauern );
	Info_AddChoice	(DIA_Mika_WOHIN, "Z miasta!", DIA_Mika_WOHIN_stadt );
};
func void DIA_Mika_WOHIN_stadt ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_stadt_15_00"); //Z miasta!
	AI_Output			(self, other, "DIA_Mika_WOHIN_stadt_12_01"); //Proszê, proszê. I zapuœci³eœ siê a¿ tutaj, tak daleko od domu?

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_Bauern_15_00"); //Z jednej z farm.
	AI_Output			(self, other, "DIA_Mika_WOHIN_Bauern_12_01"); //Farmer? Hmmm... Wiêc nie powinieneœ samotnie wêdrowaæ przez tak niebezpieczn¹ okolicê. Kto wie, co mo¿e ci siê przydarzyæ.

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_weg_15_00"); //To nie twoja sprawa.
	AI_Output			(self, other, "DIA_Mika_WOHIN_weg_12_01"); //Skoro tak twierdzisz. Tylko ¿ebyœ siê nie zdziwi³, jeœli przydarzy ci siê coœ bardzo niemi³ego. ¯yczê udanego spaceru.

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

	description	 = 	"Co to za straszliwe niebezpieczeñstwa?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition ()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASGEFAEHRLICH_15_00"); //Co to za straszliwe niebezpieczeñstwa?
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_01"); //Wiele rzeczy.
	if (other.protection[PROT_EDGE]	< ITAR_Leather_L.protection [PROT_EDGE])	//Joly: kleiner als die Lederrüstung
	{
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_02"); //Na przyk³ad bandyci. Takiego s³abeusza jak ty zjedz¹ ¿ywcem na œniadanie.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_03"); //Jeœli nie wpadniesz w rêce bandytów, zajm¹ siê tob¹ dzikie bestie i najemnicy grasuj¹cy w tych lasach.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_04"); //ZnajdŸ sobie najpierw chocia¿ jak¹œ przyzwoit¹ zbrojê.
	};
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_05"); //Za³o¿ê siê, ¿e bêdziesz krzyczeæ o pomoc, jeszcze zanim dotrzesz do nastêpnego zakrêtu.
	
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

	description	 = 	"Przypuœæmy, ¿e bêdê potrzebowa³ twojej pomocy.";
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
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_15_00"); //Przypuœæmy, ¿e bêdê potrzebowa³ twojej pomocy. Ile bêdzie mnie ona kosztowa³a?
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_01"); //Jestem skromnym s³ug¹ naszego Króla i nie sprawia mi radoœci wyzyskiwanie bezbronnych obywateli.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_02"); //Jednak skoro stawiasz sprawê w ten sposób, niewielkie wsparcie finansowe mog³oby dobrze zrobiæ naszym przysz³ym kontaktom handlowym.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_03"); //Na pocz¹tek 10 z³otych monet. Co o tym myœlisz?

	Info_ClearChoices	(DIA_Mika_WASKOSTETHILFE);

	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Muszê siê zastanowiæ.", DIA_Mika_WASKOSTETHILFE_nochnicht );
	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Czemu nie? Oto twoje 10 sztuk z³ota.", DIA_Mika_WASKOSTETHILFE_ja );

};

func void DIA_Mika_WASKOSTETHILFE_ja ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_ja_15_00"); //Czemu nie? Oto twoje 10 sztuk z³ota.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_01"); //Wspaniale. Jeœli bêdziesz potrzebowa³ mojej pomocy, wiesz, gdzie mnie znaleŸæ.
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_02"); //Mam tylko jedn¹ proœbê: nie przybiegaj do mnie z ka¿dym nieistotnym drobiazgiem, rozumiesz?
				
				Mika_Helps = TRUE;
			}
		else
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_03"); //Nie masz pieniêdzy. Mo¿e wiêc powinieneœ siê zastanowiæ, czy faktycznie potrzebujesz mojej pomocy.
			};
	AI_StopProcessInfos (self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_nochnicht_15_00"); //Pomyœlê o tym.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_nochnicht_12_01"); //Bardzo proszê. Mi³ej œmierci.

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

	description	 = 	"Zmieni³em zdanie. Oto 10 z³otych monet.";
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
	AI_Output			(other, self, "DIA_Mika_UEBERLEGT_15_00"); //Zmieni³em zdanie. Oto 10 z³otych monet.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_01"); //Doskonale. Lepiej póŸno ni¿ wcale. A teraz?
			
			Mika_Helps = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_02"); //Wróæ, kiedy ju¿ bêdziesz mia³ pieni¹dze.
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

	description	 = 	"Potrzebujê pomocy.";
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
	AI_Output			(other, self, "DIA_Mika_HILFE_15_00"); //Potrzebujê pomocy.
	AI_Output			(self, other, "DIA_Mika_HILFE_12_01"); //Skoro tak twierdzisz... Co siê sta³o?

	Info_ClearChoices	(DIA_Mika_HILFE);
	
	Info_AddChoice	(DIA_Mika_HILFE, "Goni¹ mnie bandyci.", DIA_Mika_HILFE_schongut );
	Info_AddChoice	(DIA_Mika_HILFE, "Atakuj¹ mnie potwory.", DIA_Mika_HILFE_monster );

	if (!Npc_IsDead (Alvares)) 
	&& (!Npc_IsDead (Engardo))
	&& ( (Akils_SLDstillthere == TRUE) || (Npc_KnowsInfo (other, DIA_Sarah_Bauern)) )
	{
		Info_AddChoice	(DIA_Mika_HILFE, "Farmer Akil zosta³ zaatakowany przez najemników.", DIA_Mika_HILFE_Akil );
	};
};

func void DIA_Mika_HILFE_Akil ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_Akil_15_00"); //Farmer Akil zosta³ zaatakowany przez najemników.
	AI_Output			(self, other, "DIA_Mika_HILFE_Akil_12_01"); //Co? Ta ho³ota panoszy siê na farmie Akila? A zatem nie traæmy wiêcej czasu. Za mn¹.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP (Xp_Ambient);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Mika chce mi pomóc w rozwi¹zaniu problemu Akila z najemnikami."); 

	Npc_ExchangeRoutine	(self,"Akil"); 
};

func void DIA_Mika_HILFE_monster ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_monster_15_00"); //Atakuj¹ mnie potwory.
	AI_Output			(self, other, "DIA_Mika_HILFE_monster_12_01"); //Ale w tej chwili nie widzê tu ¿adnych potworów. Na pewno wszystko zmyœli³eœ.

	AI_StopProcessInfos (self);	
};

func void DIA_Mika_HILFE_schongut ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_schongut_15_00"); //Goni¹ mnie bandyci.
	AI_Output			(self, other, "DIA_Mika_HILFE_schongut_12_01"); //Doprawdy? A gdzie siê podziali? Gdyby naprawdê ciê gonili, chyba by³oby ich widaæ, nie?

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
	AI_Output			(self, other, "DIA_Mika_Zack_12_00"); //A teraz zobacz, jak to dzia³a.
	Info_AddChoice	(DIA_Mika_Zack, DIALOG_ENDE, DIA_Mika_Zack_los );
};
func void DIA_Mika_Zack_los ()
{
	AI_StopProcessInfos (self);
	//Joly: B_attack funzt hier nicht und ist auch nicht nötig!!!!!!!!!!!
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
	AI_Output			(self, other, "DIA_Mika_WIEDERNACHHAUSE_12_00"); //Dobrze, wystarczy. Bêdê siê zmywa³.

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
	description = "Wszystko w porz¹dku?";
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
	AI_Output (other,self ,"DIA_Mika_Kap3u4u5_PERM_15_00"); //Wszystko w porz¹dku?
	AI_Output (self ,other,"DIA_Mika_Kap3u4u5_PERM_12_01"); //Wci¹¿ jesteœ ¿ywy. Zadziwiaj¹ce.
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


