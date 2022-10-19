// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //I jak, koleœ? Masz te¿ orygina³?
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Exit(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 999;
	condition	= DIA_Dragon_Undead_Exit_Condition;
	information	= DIA_Dragon_Undead_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Undead_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Hello(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 5;
	condition	= DIA_Dragon_Undead_Hello_Condition;
	information	= DIA_Dragon_Undead_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Undead_Hello_Info()
{	
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //A wiêc uda³o ci siê mnie odnaleŸæ. Bardzo d³ugo czeka³em na twoje przybycie.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Nie rozœmieszaj mnie. Zaraz mi powiesz, ¿e wszystko przebiega zgodnie z twoim planem.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //Có¿ ty mo¿esz wiedzieæ o moich zamiarach?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Czy¿ nie wys³a³em Poszukiwaczy, by naprowadzili ciê na mój œlad?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Czy nie pozostawi³em œladów mojego istnienia, tak wyraŸnych, ¿e trudno je by³o przeoczyæ?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //Czy nie dosta³eœ siê tutaj dziêki zbroi wykonanej ze smoczych jaj?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //Czy nawróceni paladyni nie byli wystarczaj¹cym powodem, byœ poszuka³ sprawcy ca³ego tego zamieszania?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Czy spotkanie z opêtanymi nieszczêœnikami nie by³o wystarczaj¹cym powodem, byœ poszuka³ sprawcy ca³ego tego zamieszania?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Choæbyœ nie wiem jak próbowa³, nie mo¿esz temu zaprzeczyæ.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Przeznaczenie tylko jednej sztuki nie zosta³o z góry okreœlone! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Zabi³eœ jednego z moich s³ug. To on mia³ pos³ugiwaæ siê Szponem...
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //S¹dzê, ¿e ty go teraz masz. I za to zginiesz!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Doœæ tego.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kto wys³a³ ciê na tê wojnê przeciw rodzajowi ludzkiemu?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Dlaczego tu przyby³eœ?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kim jesteœ?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Przeciwnikiem jest smok-o¿ywieniec. Muszê go zabiæ, zanim bêdê móg³ opuœciæ tê przeklêt¹ wyspê."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //Nadal musisz o to pytaæ? Zastanów siê, g³upcze. Przecie¿ wiesz, kim jestem.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Nie mam imienia. Tak jak ty nie masz imienia.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Mój stwórca obdarzy³ mnie bosk¹ moc¹, tak jak twój bóg obdarzy³ moc¹ ciebie.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Moim przeznaczeniem jest zniszczyæ œwiat.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Tak, jak twoje przeznaczenie wyznacza moralny kod paladynów.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Tak, jak ty sam niesiesz œmieræ, ³owco smoków.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Tak, jak twoim celem jest g³oszenie wiary Innosa, Magu Ognia.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Czy nie czujesz wiêzi, która nas ³¹czy? Tak! Ju¿ wiesz, kim jestem.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //Nie... To niemo¿liwe! Xardas zawsze mówi³...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas jest s³aby. Nie stanowi dla mnie ¿adnego zagro¿enia. Tylko ty jesteœ godzien stawiæ mi czo³a.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //Tak zosta³o zapisane. Pora, byœ pogodzi³ siê ze swoim przeznaczeniem.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Dlaczego tu przyby³eœ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //Powierzono mi m¹ moc, bym dziêki niej sk¹pa³ ten œwiat w morzu krwi.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Nie spocznê, póki ostatnia forteca praworz¹dnoœci nie obróci siê w py³.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Kto wys³a³ ciê na tê wojnê przeciw rodzajowi ludzkiemu?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Moim w³adc¹ jest Pan Ciemnoœci. Znasz go. S³yszysz jego zew.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Moje armie powstan¹ wkrótce z jego imieniem na ustach, a œwiat spowije wieczny mrok.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Doœæ tego. Wyœlê ciê z powrotem do piek³a, z którego wype³z³eœ, gadzie.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //Nie jesteœ jeszcze gotów do walki ze mn¹. Jeszcze chwila, a mój cel zostanie osi¹gniêty.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Naprawdê s¹dzisz, ¿e mo¿esz mi zaszkodziæ tym szponem?
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Twoje szcz¹tki pozwol¹ mi wyzwoliæ wiatr œmierci, który wkrótce omiecie ca³y œwiat.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





