import { verifyGatewayRequest } from '@vuxuanthanh1203/findjob-helpers-lib';
import { Application } from 'express';
import { gigRoutes } from '@gig/routes/gig';
import { healthRoutes } from '@gig/routes/health';

const BASE_PATH = '/api/v1/gig';

const appRoutes = (app: Application): void => {
  app.use('', healthRoutes());
  app.use(BASE_PATH, verifyGatewayRequest, gigRoutes());
};

export { appRoutes };
